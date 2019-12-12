#!/bin/bash

PROJECT_DIR=`realpath config`
CONFIG_DIR="$HOME/.config"

ln -s "$PROJECT_DIR/i3" "$CONFIG_DIR/i3"
ln -s "$PROJECT_DIR/conky" "$CONFIG_DIR/conky"
ln -s "$PROJECT_DIR/nvim" "$CONFIG_DIR/nvim"
ln -s "$PROJECT_DIR/tmux" "$CONFIG_DIR/tmux"
ln -s "$PROJECT_DIR/polybar" "$CONFIG_DIR/polybar"
