#!/bin/bash


# TODO:
# 1. ask for LAMBDA_API_KEY and add some hints for user to get it
# 2. run docker compose update
# 3. launch a safari browser at localhost:3001

# 🚨 Prompt for sudo
echo "🔑 Requesting administrator permission to install dependencies for LMIgnite..."
sudo -v

# 🍺 Check if Homebrew is installed
if command -v brew >/dev/null 2>&1; then
  echo "✅ Homebrew already installed! Skipping."
else
  echo "🛠️ Installing Homebrew (non-interactive)..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # 🛣️ Add Homebrew to PATH for this script session (handle both Apple Silicon and Intel)
  if [ -d /opt/homebrew/bin ]; then
    echo "🍏 Detected Apple Silicon. Adding Homebrew to PATH..."
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -d /usr/local/bin ]; then
    echo "💻 Detected Intel Mac. Adding Homebrew to PATH..."
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# ⚙️ Set environment variable to inhibit Homebrew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

# 🐳 Install Docker if not present
if command -v docker >/dev/null 2>&1; then
  echo "✅ Docker already installed! Skipping."
else
  echo "🐳 Installing Docker..."
  brew install --cask docker
fi

# 🦙 Install Colima if not present
if command -v colima >/dev/null 2>&1; then
  echo "✅ Colima already installed! Skipping."
else
  echo "🦙 Installing Colima..."
  brew install colima
fi

# 📦 Install Docker Compose plugin if not present
if [ -x "$(brew --prefix)/opt/docker-compose/bin/docker-compose" ]; then
  echo "✅ Docker Compose plugin already installed! Skipping."
else
  echo "📦 Installing Docker Compose plugin..."
  brew install docker-compose
fi

# 🔗 Enable docker compose by softlink docker-compose to docker plugin path.
PLUGIN_PATH="$HOME/.docker/cli-plugins"
mkdir -p "$PLUGIN_PATH"
echo "🔗 Linking docker-compose plugin..."
ln -sf "$(brew --prefix)/opt/docker-compose/bin/docker-compose" "$PLUGIN_PATH/docker-compose"

# 🚀 Start Colima if not already running
if colima status 2>/dev/null | grep -q '^Running:' && colima status | grep -q 'Running: true'; then
  echo "✅ Colima is already running!"
else
  echo "🚀 Starting Colima..."
  colima start
fi
