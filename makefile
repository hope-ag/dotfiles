linktmux:
	@if [ -e ~/.config/tmux ] && [ ! -L ~/.config/tmux ]; then \
		mv ~/.config/tmux ~/.config/tmux_backup; \
		echo "Backed up existing ~/.config/tmux to ~/.config/tmux_backup"; \
	fi
	ln -sf ~/.dotfiles/tmux ~/.config/tmux

linkzshrc:
	@if [ -e ~/.zshrc ] && [ ! -L ~/.zshrc ]; then \
		mv ~/.zshrc ~/.zshrc_backup; \
		echo "Backed up existing ~/.zshrc to ~/.zshrc_backup"; \
	fi
	ln -sf ~/.dotfiles/.zshrc ~/.zshrc

linkghostty:
	@if [ -e ~/.config/ghostty ] && [ ! -L ~/.config/ghostty ]; then \
		mv ~/.config/ghostty ~/.config/ghostty_backup; \
		echo "Backed up existing ~/.config/ghostty to ~/.config/ghostty_backup"; \
	fi
	ln -sf ~/.dotfiles/ghostty ~/.config/ghostty

linkall:
	make linkghostty linktmux linkzshrc

.PHONY: linktmux linkzshrc linkghostty
