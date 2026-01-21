#!/bin/sh

# Stop script on error
set -e

# Function to print messages
log() {
    printf "\033[1;32m>> %s\033[0m\n" "$1"
}

error() {
    printf "\033[1;31m!! %s\033[0m\n" "$1"
    exit 1
}

# Determine if we need sudo
if [ "$(id -u)" -eq 0 ]; then
    SUDO=""
else
    if command -v sudo >/dev/null 2>&1; then
        SUDO="sudo"
    else
        error "This script requires root privileges or sudo installed."
    fi
fi

# Basic check to ensure we are using apt/dpkg (Debian/Ubuntu based)
if ! command -v apt-get >/dev/null 2>&1; then
    error "apt-get not found. This script is intended for Ubuntu/Debian systems."
fi

log "Updating package lists..."
$SUDO apt-get update -qq

log "Installing prerequisites (software-properties-common)..."
$SUDO apt-get install -y -qq software-properties-common

log "Adding Fastfetch PPA (ppa:zhangsongcui3371/fastfetch)..."
# Check if add-apt-repository exists now
if command -v add-apt-repository >/dev/null 2>&1; then
    $SUDO add-apt-repository -y ppa:zhangsongcui3371/fastfetch
else
    error "Failed to install software-properties-common. Cannot add PPA."
fi

log "Updating package lists with new PPA..."
$SUDO apt-get update -qq

log "Installing fastfetch..."
$SUDO apt-get install -y fastfetch

log "Installation complete!"
if command -v fastfetch >/dev/null 2>&1; then
    echo ""
    fastfetch --version
    echo ""
    log "Run 'fastfetch' to test it."
else
    error "Fastfetch failed to install."
fi
