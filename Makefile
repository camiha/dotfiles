SOURCE_NVIM_DIR := ~/dotfiles/.config/nvim
TARGET_NVIM_DIR := ~/.config/nvim

all: nvim

nvim:
	mkdir -p $(TARGET_NVIM_DIR)/after/plugin
	mkdir -p $(TARGET_NVIM_DIR)/lua
	mkdir -p $(TARGET_NVIM_DIR)/plugin
	$(foreach source,$(wildcard $(SOURCE_NVIM_DIR)/after/plugin/*),ln -sf $(source) $(TARGET_NVIM_DIR)/after/plugin/$(notdir $(source));)
	$(foreach source,$(wildcard $(SOURCE_NVIM_DIR)/lua/*),ln -sf $(source) $(TARGET_NVIM_DIR)/lua/$(notdir $(source));)
	$(foreach source,$(wildcard $(SOURCE_NVIM_DIR)/plugin/*),ln -sf $(source) $(TARGET_NVIM_DIR)/plugin/$(notdir $(source));)
	ln -sf $(SOURCE_NVIM_DIR)/init.lua $(TARGET_NVIM_DIR)/init.lua