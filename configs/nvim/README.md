# 🚀 Professional Web Developer Neovim Config

Konfigurasi Neovim yang dioptimalkan untuk **Web Development** dengan support penuh untuk JavaScript, TypeScript, React, Vue, Svelte, dan framework modern lainnya.

## ✨ Highlights

- 🎯 **LSP** untuk 14+ bahasa (TypeScript, HTML, CSS, Tailwind, Vue, Svelte, dll)
- 🎨 **Auto-format** dengan Prettier on save
- 📦 **Package management** langsung dari Neovim
- 🔥 **Live Server** untuk preview HTML/CSS/JS
- 🧪 **REST Client** untuk testing API
- 🎨 **Color Picker** & syntax highlighting untuk colors
- 📝 **Markdown Preview** live
- ⚡ **TypeScript tools** (organize imports, auto-import, dll)
- 🏷️ **Auto-close & rename** HTML/JSX tags

## 📋 Prerequisites

### 1. Neovim >= 0.9.0
```bash
nvim --version
```

### 2. Node.js & npm
Untuk LSP servers dan tools:
```bash
node --version  # >= 18.0.0
npm --version
```

### 3. Git
```bash
git --version
```

### 4. Ripgrep (untuk Telescope)
```bash
# Ubuntu/Debian
sudo apt install ripgrep

# Arch Linux
sudo pacman -S ripgrep

# macOS
brew install ripgrep
```

### 5. A Nerd Font
Download dan install [Nerd Font](https://www.nerdfonts.com/) untuk icons.
Rekomendasi: JetBrainsMono Nerd Font, FiraCode Nerd Font.

## 🔧 Installation

### 1. Backup config lama (opsional)
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### 2. Clone/Copy config ini
```bash
# Jika sudah ada di yosh-dotfiles
cd ~/yosh-dotfiles/configs/nvim
```

### 3. Buka Neovim
```bash
nvim
```

Lazy.nvim akan otomatis:
- Install semua plugins
- Install LSP servers via Mason
- Install formatters & linters
- Setup semua dependencies

**Proses pertama kali akan memakan waktu 2-5 menit.**

### 4. Wait for installation
Tunggu sampai semua plugins selesai ter-install. Anda akan melihat window Lazy.nvim dengan progress.

### 5. Restart Neovim
```bash
# Keluar dari Neovim
:qa

# Buka lagi
nvim
```

### 6. Verify installation
```bash
# Check LSP servers
:Mason

# Check LSP di file TypeScript/JavaScript
nvim test.ts
:LspInfo

# Check formatter
:ConformInfo
```

## 🎯 Quick Start

### 1. Buat project baru
```bash
mkdir my-web-project
cd my-web-project
npm init -y
npm install react react-dom
nvim .
```

### 2. Buat file React component
```bash
nvim src/App.tsx
```

```typescript
import React, { useState } from 'react';

export function App() {
  const [count, setCount] = useState(0);
  
  return (
    <div className="flex items-center justify-center h-screen">
      <button 
        onClick={() => setCount(count + 1)}
        className="px-4 py-2 bg-blue-500 text-white rounded"
      >
        Count: {count}
      </button>
    </div>
  );
}
```

### 3. Essential Keymaps

#### File Navigation
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files

#### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `<leader>f` - Format file
- `]d` / `[d` - Next/previous diagnostic

#### TypeScript Specific
- `<leader>to` - Organize imports
- `<leader>tu` - Remove unused imports
- `<leader>ti` - Add missing imports
- `<leader>tf` - Fix all
- `<leader>im` - Auto import

#### Web Dev Tools
- `<leader>ls` - Start Live Server
- `<leader>cp` - Color Picker
- `<leader>mp` - Markdown Preview
- `<leader>rr` - Run REST request
- `<leader>nr` - Run NPM script

#### Package.json
- `<leader>ns` - Show package versions
- `<leader>nu` - Update package
- `<leader>ni` - Install package

#### Editing
- `<leader>w` - Save file
- `<C-s>` - Save file (insert/normal mode)
- `jj` or `jk` - Exit insert mode
- `<leader>x` - Quit
- `<leader>c` - Close buffer

#### Window Navigation
- `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` - Navigate splits
- `<A-h>` / `<A-j>` / `<A-k>` / `<A-l>` - Resize splits
- `<M-h>` / `<M-j>` / `<M-k>` / `<M-l>` - Move lines

#### Buffers/Tabs
- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer
- `<leader>1-9` - Jump to buffer 1-9

## 🎨 Customization

### Change Theme
Edit `lua/plugins/ui.lua`:
```lua
-- Themes yang populer untuk web dev:
-- "folke/tokyonight.nvim"
-- "catppuccin/nvim"
-- "rebelot/kanagawa.nvim"
-- "EdenEast/nightfox.nvim"
```

### Disable Auto-format
```vim
" Temporary (current session)
:let g:disable_autoformat = 1

" Per buffer
:let b:disable_autoformat = 1
```

Atau tambahkan di `options.lua`:
```lua
vim.g.disable_autoformat = true
```

### Custom Prettier Settings
Buat `.prettierrc` di root project:
```json
{
  "semi": false,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "all",
  "printWidth": 80,
  "arrowParens": "avoid"
}
```

### Add Custom LSP Server
Edit `lua/plugins/lsp.lua`:
```lua
lspconfig.your_lsp.setup({
  -- config here
})
```

Tambahkan ke `ensure_installed` di mason-lspconfig.

## 📁 Project Structure

```
nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin versions (auto-generated)
├── README.md                  # This file
├── WEBDEV_FEATURES.md         # Detailed features guide
│
└── lua/
    ├── core/
    │   ├── options.lua        # Vim options
    │   ├── keymaps.lua        # Keybindings
    │   └── lazy.lua           # Plugin manager setup
    │
    └── plugins/
        ├── init.lua           # Plugin loader
        ├── ui.lua             # UI plugins (theme, statusline, etc)
        ├── lsp.lua            # LSP configuration
        ├── cmp.lua            # Completion (blink.cmp)
        ├── treesitter.lua     # Syntax highlighting
        ├── telescope.lua      # Fuzzy finder
        ├── formatter.lua      # Code formatting
        ├── git.lua            # Git integration
        ├── explorer.lua       # File explorer
        ├── editor.lua         # Editor enhancements
        ├── comment.lua        # Comment utilities
        ├── whichkey.lua       # Key helper
        ├── webdev.lua         # Web dev specific tools ⭐
        └── mason-tools.lua    # Auto-install tools
```

## 🔥 Framework-Specific Tips

### React / Next.js
```typescript
// Auto-import works
import { useState } from 'react'; // ← auto-imported dengan <leader>im

// Tailwind autocomplete
<div className="flex items-|">  // ← autocomplete muncul

// Organize imports
<leader>to
```

### Vue 3
```vue
<script setup lang="ts">
// Volar LSP aktif
import { ref } from 'vue';

const count = ref(0);
</script>

<template>
  <button @click="count++">{{ count }}</button>
</template>
```

### Svelte / SvelteKit
```svelte
<script lang="ts">
  let count = 0;
</script>

<button on:click={() => count++}>
  {count}
</button>
```

## 🐛 Troubleshooting

### LSP tidak jalan
```vim
:LspInfo          " Check LSP status
:Mason            " Check installed servers
:MasonLog         " Check Mason logs
```

### Plugin error
```vim
:Lazy             " Open plugin manager
:Lazy sync        " Sync plugins
:Lazy clean       " Remove unused plugins
:Lazy update      " Update all plugins
```

### Formatter tidak jalan
```vim
:ConformInfo      " Check formatters
```

### Slow startup
```vim
:Lazy profile     " Check plugin load times
```

### Reset everything
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
nvim  # Will reinstall everything
```

## 📚 Learning Resources

- `:help` - Neovim built-in help
- `:Tutor` - Neovim interactive tutorial
- [Neovim docs](https://neovim.io/doc/)
- [LSP config docs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
- [Lazy.nvim docs](https://github.com/folke/lazy.nvim)

## 🤝 Contributing

Punya saran atau improvement? Silakan buat issue atau PR!

## 📝 License

MIT License - Feel free to use and modify!

## 🙏 Credits

Built with:
- [Neovim](https://neovim.io/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Dan banyak plugin lainnya!

---

**Happy Coding! 🚀**

Made with ❤️ for Web Developers
