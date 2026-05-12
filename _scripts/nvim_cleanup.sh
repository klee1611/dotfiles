#!/usr/bin/env bash
# Manual utility script you can run if treesitter or mason caches get corrupted

set -e

echo "Cleaning up Neovim cache and treesitter parsers..."

NVIM_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/nvim"

# Remove corrupted treesitter parsers
if [ -d "$NVIM_DATA/lazy/nvim-treesitter" ]; then
    echo "Cleaning nvim-treesitter parser cache..."
    rm -rf "$NVIM_DATA/lazy/nvim-treesitter/parser" 2>/dev/null || true
    rm -rf "$NVIM_DATA/lazy/nvim-treesitter/parser-info" 2>/dev/null || true
fi

# Clean Mason LSP package cache
if [ -d "$NVIM_DATA/mason" ]; then
    echo "Cleaning Mason LSP server cache..."
    rm -rf "$NVIM_DATA/mason/packages/gopls" 2>/dev/null || true
fi

# Clean stale ElixirLS Mix install cache (common cause of redefining-module errors)
ELIXIR_MIX_CACHE="${HOME}/Library/Caches/mix/installs"         # macOS
ELIXIR_MIX_CACHE_LINUX="${XDG_CACHE_HOME:-$HOME/.cache}/mix/installs"  # Linux / WSL
for cache_dir in "$ELIXIR_MIX_CACHE" "$ELIXIR_MIX_CACHE_LINUX"; do
    if [ -d "$cache_dir" ]; then
        echo "Cleaning ElixirLS Mix install cache at ${cache_dir}..."
        find "$cache_dir" -mindepth 2 -maxdepth 2 -name "_build" -type d \
            -exec rm -rf {} + 2>/dev/null || true
    fi
done

echo "Neovim cleanup complete. Parsers and LSP servers will be reinstalled on next launch."
