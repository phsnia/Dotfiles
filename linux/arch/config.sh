config() {
    # --- Time ---
    sudo timedatectl set-timezone Asia/Ho_Chi_Minh
    sudo timedatectl set-ntp true

    # --- Dotfiles ---
    local dotfiles
    dotfiles="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

    ln -sf "$dotfiles/.bashrc" "$HOME/.bashrc"

    rm -rf -- "$HOME/.config"
    ln -s "$dotfiles/.config" "$HOME/.config"

    rm -rf -- "$HOME/.local"
    ln -s "$dotfiles/.local" "$HOME/.local"
}
config
