#!/usr/bin/env bash
# this script downloads sprite assets from github.

WORKING_DIR=$(pwd)
SCRIPT_DIR=$(dirname "$0")

cd "$SCRIPT_DIR"
mkdir ../assets/images/sprites/pico8
cd ../assets/images/sprites/pico8
curl -LO https://github.com/hastebrot/sprites/raw/master/pico8/38190_sprites.png
cd "$WORKING_DIR"
