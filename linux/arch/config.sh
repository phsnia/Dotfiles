config() {
    # --- Time ---
    sudo timedatectl set-timezone Asia/Ho_Chi_Minh
    sudo timedatectl set-ntp true

    # --- Dotfiles ---
    local dotfiles
    dotfiles="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

    ln -sfn "$dotfiles/.bashrc" "$HOME/.bashrc"

    # rm -rf -- "$HOME/.config"
    ln -sTfn "$dotfiles/.config" "$HOME/.config"

    # rm -rf -- "$HOME/.local"
    # ln -sfn "$dotfiles/.local/share/fonts" "$HOME/.local/share/fonts"
}
config
