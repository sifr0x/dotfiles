#!/usr/bin/env bash
DOTFILES_DIR=$(dirname -- "$0")
DOTFILES_DIR=$(readlink -f "$DOTFILES_DIR")

cat <<EOF > ${HOME}/.sifr0x_dotfiles
export DOTFILES_BASE_DIR="$DOTFILES_DIR"
EOF

source ${HOME}/.sifr0x_dotfiles
mkdir -p ~/.config

# neovim
NVIM_PATH="$DOTFILES_BASE_DIR/nvim"
ln -s $NVIM_PATH ~/.config/nvim

# tmux
TMUX_CONF="$DOTFILES_BASE_DIR/tmux/tmux.conf"
ln -s $TMUX_CONF ~/.tmux.conf

# zsh
cat <<EOF >> ${HOME}/.zshrc
source ${HOME}/.sifr0x_dotfiles
source ${DOTFILES_BASE_DIR}/zsh/environment.sh
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
EOF
