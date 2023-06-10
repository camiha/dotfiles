ZSH_SOURCE_DIR := ~/dotfiles/zsh
ZSH_TARGET_DIR := ~

NVIM_SOURCE_DIR := ~/dotfiles/.config/nvim
NVIM_TARGET_DIR := ~/.config/nvim
NVIM_PACKER_DIR := ~/.local/share/nvim/site/pack/packer/start/packer.nvim

LAZYGIT_SOURCE_DIR := ~/dotfiles/lazygit
LAZYGIT_TARGET_DIR := ~/Library/Application\ Support/lazygit

all: zsh nvim lazygit

.PHONY: zsh
zsh:
	ln -sf $(ZSH_SOURCE_DIR)/.zshrc $(ZSH_TARGET_DIR)/.zshrc

.PHONY: nvim
nvim:
	if [ ! -d $(NVIM_PACKER_DIR) ] || [ ! -e $(NVIM_PACKER_DIR) ]; then \
		git clone --depth 1 https://github.com/wbthomason/packer.nvim $(NVIM_PACKER_DIR); \
	fi
	mkdir -p $(NVIM_TARGET_DIR)/after/plugin
	mkdir -p $(NVIM_TARGET_DIR)/lua
	mkdir -p $(NVIM_TARGET_DIR)/plugin
	mkdir -p $(NVIM_TARGET_DIR)/snippets
	$(foreach source,$(wildcard $(NVIM_SOURCE_DIR)/after/plugin/*),ln -sf $(source) $(NVIM_TARGET_DIR)/after/plugin/$(notdir $(source));)
	$(foreach source,$(wildcard $(NVIM_SOURCE_DIR)/lua/*),ln -sf $(source) $(NVIM_TARGET_DIR)/lua/$(notdir $(source));)
	$(foreach source,$(wildcard $(NVIM_SOURCE_DIR)/plugin/*),ln -sf $(source) $(NVIM_TARGET_DIR)/plugin/$(notdir $(source));)
	$(foreach source,$(wildcard $(NVIM_SOURCE_DIR)/snippets/*),ln -sf $(source) $(NVIM_TARGET_DIR)/snippets/$(notdir $(source));)
	ln -sf $(NVIM_SOURCE_DIR)/init.lua $(NVIM_TARGET_DIR)/init.lua

.PHONY: lazygit
lazygit: 
	echo "lazygit"
	mkdir -p $(LAZYGIT_TARGET_DIR)
	ln -sf $(LAZYGIT_SOURCE_DIR)/config.yml $(LAZYGIT_TARGET_DIR)/config.yml


