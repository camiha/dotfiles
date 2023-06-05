NVIM_SOURCE_DIR := ~/dotfiles/.config/nvim
NVIM_TARGET_DIR := ~/.config/nvim
NVIM_PACKER_DIR := ~/.local/share/nvim/site/pack/packer/start/packer.nvim

all: nvim

nvim:
	if [ ! -d $(NVIM_PACKER_DIR) ] || [ ! -e $(NVIM_PACKER_DIR) ]; then \
		git clone --depth 1 https://github.com/wbthomason/packer.nvim $(NVIM_PACKER_DIR); \
	fi
	mkdir -p $(NVIM_TARGET_DIR)/after/plugin
	mkdir -p $(NVIM_TARGET_DIR)/lua
	mkdir -p $(NVIM_TARGET_DIR)/plugin
	$(foreach source,$(wildcard $(NVIM_SOURCE_DIR)/after/plugin/*),ln -sf $(source) $(NVIM_TARGET_DIR)/after/plugin/$(notdir $(source));)
	$(foreach source,$(wildcard $(NVIM_SOURCE_DIR)/lua/*),ln -sf $(source) $(NVIM_TARGET_DIR)/lua/$(notdir $(source));)
	$(foreach source,$(wildcard $(NVIM_SOURCE_DIR)/plugin/*),ln -sf $(source) $(NVIM_TARGET_DIR)/plugin/$(notdir $(source));)
	ln -sf $(NVIM_SOURCE_DIR)/init.lua $(NVIM_TARGET_DIR)/init.lua
