#!/usr/bin/env bash
set -e

install() {
    for pkg in "$@"; do
        if ! pacman -Q "$pkg" &>/dev/null; then
            sudo pacman -S --needed --noconfirm "$pkg"
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
    dmenu \
    neovim \
    feh \
    htop

sudo systemctl is-enabled ly@tty1.service &>/dev/null ||
    sudo systemctl enable ly@tty1.service

# --- Audio ---
install \
    pipewire \
    pipewire-pulse \
    pavucontrol \
    alsa-utils \
    sof-firmware

# --- Yay ---
if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git "$HOME/yay"

    (
        cd "$HOME/yay"
        makepkg -si --noconfirm
    )
fi

# --- AUR ---
yay -S --needed --noconfirm \
    brave-bin \
    zed
    # flyenv-bin

# --- Utility ---
install yazi
install docker
install thunar
install udisks2
install udiskie

# --- Fonts ---
install noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    ttf-dejavu \
    ttf-liberation

# --- C/C++ Developement ---
install clang \
    gdb \
    lldb \
    cmake \
    ninja \
    valgrind

# --- Prog Development ---
install mise
yay -S jetbrains-toolbox
install scrcpy

# --- C3 ---
install c3c

sudo systemctl enable --now docker

echo "==> Installation complete."
