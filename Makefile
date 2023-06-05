# Dotfiles directory
DOTFILES_DIR = ~/dotfiles
# Neovim configuration directory
NVIM_DIR = ~/.config/nvim
# Neovim dotfiles directory
NVIM_DOTFILES_DIR = $(DOTFILES_DIR)/.config/nvim

# Default target
all: link-nvim

# Create directory structure and link neovim configuration files
link-nvim:
	find $(NVIM_DOTFILES_DIR) -type d -exec bash -c 'mkdir -p "$(NVIM_DIR)/$$(realpath --relative-to=$(NVIM_DOTFILES_DIR) {})"' \;
	find $(NVIM_DOTFILES_DIR) -type f -exec bash -c 'ln -sf "{}" "$(NVIM_DIR)/$$(realpath --relative-to=$(NVIM_DOTFILES_DIR) {})"' \;

.PHONY: all link-nvim
