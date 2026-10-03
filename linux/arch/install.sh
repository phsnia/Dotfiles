# --- Core ---
sudo pacman -Syu git base-devel

# --- Time ---
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo timedatectl set-ntp true

# --- Driver ---
sudo pacman -S mesa \
intel-media-driver libva-intel-driver vulkan-intel \
vulkan-radeon xf86-video-amdgpu xf86-video-ati \
vulkan-nouveau xf86-video-nouveau

# --- Window Manager ---
sudo pacman -Syu i3 xorg-server xorg-xinit ly
sudo systemctl enable ly@tty1.service

# --- Audio ---
sudo pacman -Syu pipewire pipewire-pulse pavucontrol

