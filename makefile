linktmux:
	ln -s ~/.dotfiles/tmux ~/.config/tmux

linkzshrc:
	ln -s ~/.dotfiles/.zshrc ~/.zshrc

linkghostty:
	ln -s ~/.dotfiles/ghostty ~/.config/ghostty

linkall:
	make linkghostty linktmux linkzshrc

.PHONY: linktmux linkzshrc linkghostty
