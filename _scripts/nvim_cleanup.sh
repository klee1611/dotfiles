#!/usr/bin/env bash
# Manual utility script you can run if treesitter or mason caches get corrupted

set -e

echo "Cleaning up Neovim cache and treesitter parsers..."

# Remove corrupted treesitter parsers
NVIM_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"
if [ -d "$NVIM_DATA/lazy/nvim-treesitter" ]; then
    echo "Cleaning nvim-treesitter parser cache..."
    rm -rf "$NVIM_DATA/lazy/nvim-treesitter/parser" 2>/dev/null || true
    rm -rf "$NVIM_DATA/lazy/nvim-treesitter/parser-info" 2>/dev/null || true
fi

# Clean Mason cache if it exists
if [ -d "$NVIM_DATA/mason" ]; then
    echo "Cleaning Mason cache for LSP servers..."
    rm -rf "$NVIM_DATA/mason/packages/gopls" 2>/dev/null || true
fi

echo "Neovim cleanup complete. Parsers and LSP servers will be reinstalled on next launch."
