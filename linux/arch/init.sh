install_pkg() {
    # --- Core ---
    sudo pacman -Syu git base-devel vim alacritty

    # --- Driver ---
    sudo pacman -S mesa \
    intel-media-driver libva-intel-driver vulkan-intel \
    vulkan-radeon xf86-video-amdgpu xf86-video-ati \
    vulkan-nouveau xf86-video-nouveau

    # --- Window Manager ---
    sudo pacman -Syu i3 xorg-server xorg-xinit ly dmenu
    sudo systemctl enable ly@tty1.service

    # --- Audio ---
    sudo pacman -Syu pipewire pipewire-pulse pavucontrol

    # --- Yay ---
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay
    makepkg -si
    yay --version

    # --- ---
    yay -Syu brave-bin
    yay -Syu zed
    sudo pacman -Syu yazi
}

config() {
    # --- Time ---
    sudo timedatectl set-timezone Asia/Ho_Chi_Minh
    sudo timedatectl set-ntp true

    # --- Link ---
    ln -sf "$PWD/.bashrc" ~/.bashrc
    rm -rf ~/.config
    ln -sf "$PWD/.config" ~/
    rm -rf ~/.local
    ln -sf "$PWD/.local" ~/
}
config
