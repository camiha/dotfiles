
#!/bin/zsh

create_symlinks() {
    local source_dir=$1
    local target_dir=$2

    mkdir -p "$target_dir"

    for file in "$source_dir"/*; do
        if [ -d "$file" ]; then
            mkdir -p "$target_dir/$(basename "$file")"
            create_symlinks "$file" "$target_dir/$(basename "$file")"
        else
            ln -sf "$file" "$target_dir/$(basename "$file")"
        fi
    done
}

NVIM_SOURCE_DIR="$(pwd)/nvim"
NVIM_TARGET_DIR="$HOME/.config/nvim"

rm -rf "$NVIM_TARGET_DIR"
create_symlinks "$NVIM_SOURCE_DIR" "$NVIM_TARGET_DIR"

create_symlinks "$(pwd)/zsh" "$HOME/"
create_symlinks "$(pwd)/iterm2" "$HOME/.iterm2"

echo "symlinks created successfully."