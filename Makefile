DOTFILES_SHARED_DIR := $(CURDIR)/home
BACKUP_DIR := $(HOME)/.dotfiles.bak

# format: "source:destination"
DOTFILES_SHARED := \
    .zshrc:~/.zshrc \
    .tmux.conf:~/.tmux.conf \
    .emacs:~/.emacs \
    .emacs.custom:~/.emacs.custom \
    .emacs.d:~/.emacs.d\
    .config/alacritty:~/.config/alacritty \
    .config/hypr:~/.config/hypr \
    .config/i3:~/.config/i3 \
    .config/nvim:~/.config/nvim \
    .config/rofi:~/.config/rofi \
    .config/tms:~/.config/tms \
    .config/tofi:~/.config/tofi \
    .config/ghostty:~/.config/ghostty \
    .config/waybar:~/.config/waybar \
    .config/sway:~/.config/sway \


# Default target: Install all dotfiles
.PHONY: install
install: clean link

# Create symlinks
.PHONY: link
link:
	@echo "INFO: Creating symlinks..."
	@$(foreach dotfile, $(DOTFILES_SHARED), \
	    src=$(word 1,$(subst :, ,$(dotfile))); \
	    dest=$(word 2,$(subst :, ,$(dotfile))); \
	    ln -sf $(DOTFILES_SHARED_DIR)/$$src $$(eval echo $$dest); \
	    echo "Linked $(DOTFILES_SHARED_DIR)/$$src -> $$dest"; \
	)

# Remove existing files or directories
.PHONY: clean
clean:
	@echo "INFO: Removing existing files or directories..."
	@$(foreach dotfile, $(DOTFILES_SHARED), \
	    dest=$(word 2,$(subst :, ,$(dotfile))); \
	    if [ -e $$(eval echo $$dest) ] || [ -L $$(eval echo $$dest) ]; then \
	        echo "Removing $$dest"; \
	        rm -rf $$(eval echo $$dest); \
	    fi; \
	)

.PHONY: backup
backup:
	@echo "INFO: Backing up existing files or directories..."
	@mkdir -p $(BACKUP_DIR)
	@$(foreach dotfile, $(DOTFILES_SHARED), \
	    src=$(word 1,$(subst :, ,$(dotfile))); \
	    dest=$(word 2,$(subst :, ,$(dotfile))); \
	    if [ -e $$(eval echo $$dest) ] && [ ! -L $$(eval echo $$dest) ]; then \
	        echo "Backing up $$dest to $(BACKUP_DIR)"; \
	        mv $$(eval echo $$dest) $(BACKUP_DIR); \
	    elif [ -L $$(eval echo $$dest) ]; then \
	        echo "$$dest is a symlink. Removing it..."; \
	        rm $$(eval echo $$dest); \
	    fi; \
	)
