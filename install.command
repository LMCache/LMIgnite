#!/bin/bash

# ==========================================================
# 🚀 LMIgnite Installer: One-Click Deployment
# 
# LMIgnite is a product solution that allows users to do 1-click deployment of 
# vLLM production stack and LMCache as a cloud/on-prem hosted commercial cloud 
# for fast and low latency genAI inference serving.
#
# This installer automatically:
# - Installs Docker and required dependencies (if needed)
# - Collects Lambda Labs API key and HuggingFace token securely
# - Downloads and launches the LMIgnite stack via Docker Compose
# - Opens the web UI at http://localhost:3001
#
# For detailed documentation, visit: https://docs.tensormesh.ai/
# ==========================================================

set -euo pipefail  # Strict error handling

# ==========================================================
# Constants and Configuration
# ==========================================================
readonly COMPOSE_FILE="lmignite-docker-compose.yml"
readonly SERVICE_URL="http://localhost:3001"
readonly API_DOCS_URL="http://localhost:3001/api/docs"
readonly COMPOSE_URL="https://raw.githubusercontent.com/LMCache/LMIgnite/refs/heads/main/docker-compose.yml"
readonly DOCS_URL="https://docs.tensormesh.ai/"
readonly LAMBDA_DOCS_URL="https://docs.tensormesh.ai/quickstart/prerequisites.html#"
readonly HF_DOCS_URL="https://docs.tensormesh.ai/quickstart/prerequisites.html#"
readonly LAMBDA_WEBSITE="https://lambda.ai/"
readonly HF_WEBSITE="https://huggingface.co/settings/tokens"

# Timeouts and limits
readonly DOCKER_START_TIMEOUT=120  # 2 minutes
readonly SERVICE_START_TIMEOUT=600  # 10 minutes
readonly SERVICE_CHECK_INTERVAL=2   # 2 seconds

# Global variables (will be set during execution if not already in environment)

# ==========================================================
# Error Handling and Utilities
# ==========================================================

# Graceful shutdown handler
cleanup() {
  echo -e "\n🧹 Cleaning up: Stopping LMIgnite Docker Compose stack..."
  if [[ -f "$COMPOSE_FILE" ]]; then
    docker compose -f "$COMPOSE_FILE" down --remove-orphans || true
  fi
  echo "👋 Exiting installer. Bye!"
  exit 0
}

# Error handler
error_handler() {
  local exit_code=$?
  local line_number=$1
  echo "❌ Error occurred on line $line_number (exit code: $exit_code)"
  cleanup
}

# Set up error handling
trap cleanup SIGINT SIGTERM
trap 'error_handler $LINENO' ERR

# ==========================================================
# Utility Functions
# ==========================================================

print_header() {
  echo "=========================================================="
  echo "$1"
  echo "=========================================================="
}

print_step() {
  echo ""
  echo "-------------------------------------"
  echo "$1"
  echo "-------------------------------------"
}

print_success() {
  echo "✅ $1"
}

print_error() {
  echo "❌ $1" >&2
}

print_info() {
  echo "ℹ️  $1"
}

print_warning() {
  echo "⚠️  $1"
}

# Check if command exists
check_command() {
  command -v "$1" >/dev/null 2>&1
}

# Wait for user input
wait_for_key() {
  echo ""
  echo "Press any key to continue..."
  read -n 1 -s
  echo ""
}

# Validate URL accessibility
check_url() {
  local url="$1"
  curl -fsSL --max-time 10 "$url" >/dev/null 2>&1
}

# ==========================================================
# API Key Collection Functions
# ==========================================================

validate_lambda_key() {
  local key="$1"
  [[ -n "$key" && ! "$key" =~ [[:space:]] && ${#key} -ge 10 ]]
}

validate_hf_token() {
  local token="$1"
  [[ -n "$token" && ! "$token" =~ [[:space:]] && "$token" =~ ^hf_ ]]
}

get_lambda_labs_api_key() {
  # Check if already set in environment
  if [[ -n "${LAMBDA_LABS_API_KEY:-}" ]]; then
    if validate_lambda_key "$LAMBDA_LABS_API_KEY"; then
      print_success "Using Lambda Labs API key from environment variable"
      return 0
    else
      print_warning "Environment variable LAMBDA_LABS_API_KEY is set but invalid"
      unset LAMBDA_LABS_API_KEY
    fi
  fi
  
  echo ""
  echo "📖 You will need a Lambda Labs API key to launch and manage cloud GPU instances."
  echo "🔗 Please see: $LAMBDA_DOCS_URL for detailed instructions."
  echo "   Quick steps: Go to $LAMBDA_WEBSITE → Sign Up/Login → API Keys → Generate API Key"
  echo "💡 Tip: To avoid this prompt in the future, export LAMBDA_LABS_API_KEY='your_key_here'"
  
  while true; do
    read -srp "🔑 Enter your Lambda Labs API key: " LAMBDA_LABS_API_KEY
    echo
    if validate_lambda_key "$LAMBDA_LABS_API_KEY"; then
      break
    else
      print_error "Invalid Lambda Labs API key. Please try again."
    fi
  done
}

get_huggingface_token() {
  # Check if already set in environment
  if [[ -n "${HF_TOKEN:-}" ]]; then
    if validate_hf_token "$HF_TOKEN"; then
      print_success "Using HuggingFace token from environment variable"
      return 0
    else
      print_warning "Environment variable HF_TOKEN is set but invalid"
      unset HF_TOKEN
    fi
  fi
  
  echo ""
  echo "📖 You need a HuggingFace token to access models from the Hugging Face Hub."
  echo "🔗 Please see: $HF_DOCS_URL for detailed instructions."
  echo "   Quick steps: Go to $HF_WEBSITE → Create new token (Read type)"
  echo "💡 Tip: To avoid this prompt in the future, export HF_TOKEN='your_token_here'"
  
  while true; do
    read -srp "🤗 Enter your HuggingFace token: " HF_TOKEN
    echo
    if validate_hf_token "$HF_TOKEN"; then
      break
    else
      print_error "Invalid HuggingFace token. Please try again."
    fi
  done
}

collect_api_keys() {
  print_step "1. Collecting API Keys"
  get_lambda_labs_api_key
  get_huggingface_token
}

# ==========================================================
# Docker Management Functions
# ==========================================================

check_docker_availability() {
  check_command docker && docker compose version >/dev/null 2>&1
}

ensure_docker_running() {
  if docker info >/dev/null 2>&1; then
    print_success "Docker daemon is running!"
    return 0
  fi
  
  print_warning "Docker daemon is not running. Attempting to start Docker..."
  
  # Try to start Docker Desktop if available
  if check_command open; then
    open -a Docker
    print_info "Waiting for Docker to start..."
    
    for ((i=1; i<=DOCKER_START_TIMEOUT/2; i++)); do
      if docker info >/dev/null 2>&1; then
        print_success "Docker is now running!"
        return 0
      fi
      sleep 2
    done
    
    print_error "Docker failed to start within $((DOCKER_START_TIMEOUT/60)) minutes."
    return 1
  else
    print_error "Please start Docker manually and run this script again."
    return 1
  fi
}

# ==========================================================
# Installation Functions
# ==========================================================

install_homebrew() {
  print_step "2. Installing Homebrew (Package Manager)"
  
  if check_command brew; then
    print_success "Homebrew already installed! Skipping."
  else
    print_info "Installing Homebrew (non-interactive, no sudo required)..."
    
    # Create Homebrew directory in user's home
    local homebrew_dir="$HOME/homebrew"
    mkdir -p "$homebrew_dir"
    
    # Download and extract Homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "$homebrew_dir"
    
    # Get the brew shellenv output and add it to bashrc
    "$homebrew_dir"/bin/brew shellenv >> "$HOME/.bashrc"
    
    # Source the brew shellenv for current session
    eval "$("$homebrew_dir"/bin/brew shellenv)"
    
    print_success "Homebrew installed to $homebrew_dir"
    print_info "brew shellenv hook added to ~/.bashrc"
  fi
  
  # Set Homebrew to not auto-update during installation
  export HOMEBREW_NO_AUTO_UPDATE=1
}

install_docker() {
  print_step "3. Installing Docker (Container Runtime)"
  
  if check_command docker; then
    print_success "Docker already installed! Skipping."
  else
    print_info "Installing Docker..."
    brew install --cask docker --no-quarantine
  fi
}

install_colima() {
  print_step "4. Installing Colima (Docker Runtime for macOS)"
  
  if check_command colima; then
    print_success "Colima already installed! Skipping."
  else
    print_info "Installing Colima..."
    brew install colima
  fi
}

install_docker_compose() {
  print_step "5. Installing Docker Compose (Container Orchestration)"
  
  if docker compose version >/dev/null 2>&1; then
    print_success "Docker Compose already available via 'docker compose'."
    return 0
  fi
  
  if brew list --formula | grep -q '^docker-compose$'; then
    print_success "Docker Compose plugin already installed via brew!"
  else
    print_info "Installing Docker Compose plugin..."
    brew install docker-compose
  fi
  
  # Ensure symlink exists
  local plugin_path="$HOME/.docker/cli-plugins"
  mkdir -p "$plugin_path"
  ln -sf "$(brew --prefix)/opt/docker-compose/bin/docker-compose" "$plugin_path/docker-compose"
}

start_colima() {
  print_step "6. Starting Colima (Docker Runtime)"
  
  if colima status 2>/dev/null | grep -q "Running: true"; then
    print_success "Colima is already running!"
  else
    print_info "Starting Colima..."
    colima start
  fi
}

# ==========================================================
# LMIgnite Launch Functions
# ==========================================================

download_compose_file() {
  print_step "7. Downloading LMIgnite Stack Configuration"
  
  print_info "Fetching LMIgnite docker-compose.yml..."
  if curl -fsSL "$COMPOSE_URL" -o "$COMPOSE_FILE"; then
    print_success "Configuration downloaded successfully"
  else
    print_error "Failed to download configuration from $COMPOSE_URL"
    exit 1
  fi
}

launch_lmignite() {
  print_step "8. Launching LMIgnite Stack (vLLM + LMCache)"
  
  print_info "Launching LMIgnite stack via Docker Compose..."
  if LAMBDA_LABS_API_KEY="${LAMBDA_LABS_API_KEY:-}" \
     HF_TOKEN="${HF_TOKEN:-}" \
     docker compose -f "$COMPOSE_FILE" up -d; then
    print_success "LMIgnite stack launched successfully"
  else
    print_error "Failed to launch LMIgnite stack"
    exit 1
  fi
}

wait_for_service() {
  print_step "9. Starting Web UI and Monitoring Service"
  
  print_info "Waiting for LMIgnite service at $SERVICE_URL ..."
  for ((i=1; i<=SERVICE_START_TIMEOUT/SERVICE_CHECK_INTERVAL; i++)); do
    if check_url "$SERVICE_URL"; then
      print_success "Service is up!"
      
      # Check if Safari popup should be skipped
      if [[ "${LMIGNITE_SKIP_SAFARI:-}" == "true" ]]; then
        print_info "Skipping Safari popup (LMIGNITE_SKIP_SAFARI=true)"
      elif check_command open; then
        print_info "Opening Safari browser..."
        open -a Safari "$SERVICE_URL"
        echo ""
        echo "💡 Tip: To skip the browser popup in the future, set LMIGNITE_SKIP_SAFARI=true"
      else
        print_warning "Could not open Safari automatically"
        echo "💡 Tip: To skip the browser popup in the future, set LMIGNITE_SKIP_SAFARI=true"
      fi
      return 0
    else
      sleep "$SERVICE_CHECK_INTERVAL"
      echo "⏳ Still waiting... ($((i * SERVICE_CHECK_INTERVAL))s elapsed)"
    fi
  done
  
  print_warning "Service did not start within $((SERVICE_START_TIMEOUT/60)) minutes"
  print_info "You can manually check the service at $SERVICE_URL"
}

# ==========================================================
# Installation Paths
# ==========================================================

run_full_installation() {
  print_header "Full Installation Path (Docker + Dependencies)"
  
  install_homebrew
  install_docker
  install_colima
  install_docker_compose
  start_colima
  
  download_compose_file
  launch_lmignite
  wait_for_service
}

run_quick_launch() {
  print_header "Quick Launch Path (Docker Already Available)"
  
  ensure_docker_running || exit 1
  
  download_compose_file
  launch_lmignite
  wait_for_service
}

# ==========================================================
# Introduction Section
# ==========================================================

show_introduction() {
  clear
  echo "🚀 Welcome to LMIgnite - One-Click LLM Deployment Platform"
  echo "=========================================================="
  echo ""
  echo "LMIgnite enables 1-click deployment of vLLM production stack and LMCache"
  echo "for fast, low-latency genAI inference serving with enterprise features."
  echo ""
  echo "Key Benefits:"
  echo "• 3-10x performance improvement with intelligent KV cache management"
  echo "• Enterprise features: Multi-tenancy, LoRA, MCP, Autoscaling, Security"
  echo "• Beautiful web UI for easy management and monitoring"
  echo "• Support for AWS, GCP, Azure, and on-premises deployments"
  echo ""
  echo "Use Cases: LLM applications, chatbots, content generation,"
  echo "real-time processing, enterprise AI inference, multi-tenant platforms"
  echo ""
  echo "📚 For detailed documentation: $DOCS_URL"
  echo ""
  echo "💡 Tip: To skip this introduction in the future, set LMIGNITE_SKIP_INTRO=true"
  echo ""
  wait_for_key
}

# ==========================================================
# Main Script Logic
# ==========================================================

main() {
  # Show introduction unless skipped
  if [[ "${LMIGNITE_SKIP_INTRO:-}" != "true" ]]; then
    show_introduction
  else
    print_info "Skipping introduction (LMIGNITE_SKIP_INTRO=true)"
  fi
  
  echo "✨ Starting LMIgnite installation... ✨"
  
  # Collect API keys first (required for both paths)
  collect_api_keys
  
  # Check if we can skip installation
  if check_docker_availability; then
    print_success "Docker and Docker Compose are already available!"
    print_info "Skipping installation steps and proceeding directly to launch..."
    run_quick_launch
  else
    print_info "Docker or Docker Compose not found. Running full installation..."
    run_full_installation
  fi
  
  echo ""
  echo "🎉 All done! LMIgnite is running at $SERVICE_URL 🚀"
  echo "📊 Web UI: $SERVICE_URL"
  echo "📚 API Docs: $API_DOCS_URL"
  echo "🔻 Press Ctrl+C to stop and cleanup, or just close this terminal window."
  
  # Wait for termination signal (e.g. Ctrl+C)
  while true; do 
    sleep 3600
  done
}

# ==========================================================
# Script Entry Point
# ==========================================================

main "$@"
