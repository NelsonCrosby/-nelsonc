#!/bin/sh

# User directory layouts
# Assumes .config/nelsonc is a clone of
#     https://github.com/NelsonCrosby/-nelsonc.git
# or  git@github.com:NelsonCrosby/-nelsonc.git

# Use init.bash on bash startup
echo 'source ~/.config/nelsonc/bash/init.bash' >>.bashrc

# Config dirs tracked in git
ln -sT nelsonc/git .config/git
ln -sT nelsonc/neovim .config/nvim

# fstab entries for bind mounts on various ~ directories
sudo cat >>/etc/fstab <<EOF

# Mounts for $USER
/files/nelsonc/projects  $HOME/Projects  none defaults,bind 0 0
/files/nelsonc/documents $HOME/Documents none defaults,bind 0 0
/files/nelsonc/games     $HOME/Games     none defaults,bind 0 0
EOF
