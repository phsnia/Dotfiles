#!/usr/bin/env bash
set -e

install() {
    for pkg in "$@"; do
        if ! pacman -Q "$pkg" &>/dev/null; then
            sudo pacman -S --needed "$pkg"
        fi
    done
}

# --- Core ---
install \
    git \
    base-devel \
    vim \
    alacritty

# --- Drivers ---
install \
    mesa \
    intel-media-driver \
    libva-intel-driver \
    vulkan-intel \
    vulkan-radeon \
    xf86-video-amdgpu \
    xf86-video-ati \
    vulkan-nouveau \
    xf86-video-nouveau

# --- Window Manager ---
install \
    i3 \
    xorg-server \
    xorg-xinit \
    ly \
    dmenu

sudo systemctl is-enabled ly@tty1.service &>/dev/null ||
    sudo systemctl enable ly@tty1.service

# --- Audio ---
install \
    pipewire \
    pipewire-pulse \
    pavucontrol

# --- Yay ---
if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git "$HOME/yay"

    (
        cd "$HOME/yay"
        makepkg -si
    )
fi

# --- AUR ---
yay -S --needed \
    brave-bin \
    zed \
    flyenv-bin

# --- Utility ---
install yazi

echo "==> Installation complete."
