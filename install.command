#!/bin/bash

# ==========================================================
# 🚀 LMIgnite Installer: Docker + Colima + Compose
# Installs and configures all required dependencies for LMIgnite.
# Lambda Labs API Key management, confidential input, and safe shutdown.
# ==========================================================

set -e

COMPOSE_FILE="lmignite-docker-compose.yml"

# ---------- Graceful Shutdown Handler ----------
cleanup() {
  echo -e "\n🧹 Cleaning up: Stopping LMIgnite Docker Compose stack..."
  if [ -f "$COMPOSE_FILE" ]; then
    docker compose -f "$COMPOSE_FILE" down || true
  fi
  echo "👋 Exiting installer. Bye!"
  exit 0
}
trap cleanup SIGINT SIGTERM

echo "✨ Welcome to the LMIgnite installer! ✨"

# --------------------------------------
# 1. Prompt for Lambda Labs API Key (secret input)
# --------------------------------------
while true; do
  read -srp "🔑 Enter your LAMBDA_LABS_API_KEY: " LAMBDA_LABS_API_KEY
  echo
  # Basic validation
  if [[ -z "$LAMBDA_LABS_API_KEY" ]] || [[ "$LAMBDA_LABS_API_KEY" =~ [[:space:]] ]] || [[ ${#LAMBDA_LABS_API_KEY} -lt 10 ]]; then
    echo "❌ Invalid LAMBDA_LABS_API_KEY. Please try again."
  else
    break
  fi
done

export LAMBDA_LABS_API_KEY
if ! grep -q "LAMBDA_LABS_API_KEY=" "$HOME/.bashrc" 2>/dev/null; then
  echo "export LAMBDA_LABS_API_KEY=\"$LAMBDA_LABS_API_KEY\"" >> "$HOME/.bashrc"
  echo "🔑 LAMBDA_LABS_API_KEY added to ~/.bashrc!"
fi

# --------------------------------------
# 2. Request sudo at start
# --------------------------------------
echo "🔑 Requesting administrator permission to install dependencies..."
sudo -v

# --------------------------------------
# 3. Homebrew Install/Check
# --------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  echo "🛠️ Installing Homebrew (non-interactive)..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add Homebrew to PATH for this session and future
  if [ -d /opt/homebrew/bin ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.bashrc"
  elif [ -d /usr/local/bin ]; then
    eval "$(/usr/local/bin/brew shellenv)"
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.bashrc"
  fi
else
  echo "✅ Homebrew already installed! Skipping."
  # Add brew to PATH for this session, just in case
  if [ -d /opt/homebrew/bin ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -d /usr/local/bin ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

export HOMEBREW_NO_AUTO_UPDATE=1

# --------------------------------------
# 4. Docker & Colima Install/Check
# --------------------------------------
if ! command -v docker >/dev/null 2>&1; then
  echo "🐳 Installing Docker..."
  brew install --cask docker
else
  echo "✅ Docker already installed! Skipping."
fi

if ! command -v colima >/dev/null 2>&1; then
  echo "🦙 Installing Colima..."
  brew install colima
else
  echo "✅ Colima already installed! Skipping."
fi

# --------------------------------------
# 5. Docker Compose plugin (plugin method, not legacy)
# --------------------------------------
if ! docker compose version >/dev/null 2>&1; then
  if brew list --formula | grep -q '^docker-compose$'; then
    echo "✅ Docker Compose plugin already installed via brew!"
  else
    echo "📦 Installing Docker Compose plugin..."
    brew install docker-compose
  fi
  # Symlink if needed
  PLUGIN_PATH="$HOME/.docker/cli-plugins"
  mkdir -p "$PLUGIN_PATH"
  ln -sf "$(brew --prefix)/opt/docker-compose/bin/docker-compose" "$PLUGIN_PATH/docker-compose"
else
  echo "✅ Docker Compose already available via 'docker compose'."
fi

# --------------------------------------
# 6. Start Colima if not running
# --------------------------------------
if colima status 2>/dev/null | grep -q "Running: true"; then
  echo "✅ Colima is already running!"
else
  echo "🚀 Starting Colima..."
  colima start
fi

# --------------------------------------
# 7. Download and run docker compose up
# --------------------------------------
echo "📥 Fetching LMIgnite docker-compose.yml..."
curl -fsSL "https://raw.githubusercontent.com/LMCache/LMIgnite/refs/heads/main/docker-compose.yml" -o "$COMPOSE_FILE"

echo "🛳️ Launching LMIgnite stack via Docker Compose..."
LAMBDA_LABS_API_KEY="$LAMBDA_LABS_API_KEY" docker compose -f "$COMPOSE_FILE" up -d

# --------------------------------------
# 8. Wait for localhost:3001 to respond, then open in Safari
# --------------------------------------
echo "⏳ Waiting for LMIgnite service at http://localhost:3001 ..."
for i in {1..300}; do
  if curl -sSf "http://localhost:3001" >/dev/null; then
    echo "✅ Service is up!"
    open -a Safari "http://localhost:3001"
    break
  else
    sleep 2
    echo "⏳ Still waiting..."
  fi
done

echo "🎉 All done! LMIgnite is running at http://localhost:3001 🚀"
echo "🔻 Press Ctrl+C to stop and cleanup, or just close this terminal window."
# Wait for termination signal (e.g. Ctrl+C)
while true; do sleep 3600; done
