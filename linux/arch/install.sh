# --- Window Manager ---
sudo pacman -Syu i3 xorg-server xorg-xinit ly
sudo systemctl enable ly@tty1.service

# --- Audio ---
sudo pacman -Syu pipewire pavucontrols
#
