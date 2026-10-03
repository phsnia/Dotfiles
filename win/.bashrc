alias ll="ls -alF --color=auto"
alias src="source ~/.bashrc"
function force_push() {
    git status

    read -r -p "Do you want to force push? (y/N) " confirm

    if [[ "$confirm" != "y" ]]; then
        echo "Cancelled."
        return
    fi

    git add .

    read -r -p "Commit message: " message

    git commit -m "$message"

    if [[ $? -ne 0 ]]; then
        echo "Commit failed. Force push cancelled."
        return
    fi

    git push origin main
}
