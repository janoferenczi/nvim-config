#!/bin/bash
source ./.env
echo "root:$ROOT_PASSWORD" | chpasswd
useradd -m $USER
usermod -aG wheel $USER
echo "$USER:$PASSWORD" | chpasswd

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

pacman -Syuu --noconfirm
pacman -Sy --noconfirm git helix tmux zsh
