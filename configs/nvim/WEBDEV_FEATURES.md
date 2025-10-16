# Web Development Features

Konfigurasi Neovim ini telah ditingkatkan menjadi setup profesional untuk web development dengan fitur-fitur berikut:

## 🚀 Fitur Utama

### 1. **Language Server Protocol (LSP)**
LSP servers yang ter-install otomatis:
- **TypeScript/JavaScript** (`ts_ls`) - IntelliSense untuk TS/JS
- **ESLint** - Linting dan auto-fix
- **HTML** - HTML IntelliSense
- **CSS/SCSS/Less** (`cssls`) - CSS IntelliSense
- **Tailwind CSS** - Autocomplete class Tailwind
- **Emmet** - HTML/CSS abbreviations
- **JSON** (`jsonls`) - JSON schemas & validation
- **GraphQL** - GraphQL support
- **Prisma** - Prisma ORM support
- **Vue** (`volar`) - Vue 3 support
- **Svelte** - Svelte support
- **Astro** - Astro framework support

### 2. **Formatters & Linters**
Auto-format on save dengan Prettier untuk:
- JavaScript/TypeScript (`.js`, `.ts`, `.jsx`, `.tsx`)
- HTML, CSS, SCSS, SASS, Less
- JSON, YAML
- Markdown, MDX
- Vue, Svelte, Astro
- GraphQL
- Prisma

### 3. **TypeScript Tools**
Plugin `typescript-tools.nvim` dengan keymaps:
- `<leader>to` - Organize imports
- `<leader>ts` - Sort imports
- `<leader>tu` - Remove unused imports
- `<leader>ti` - Add missing imports
- `<leader>tf` - Fix all issues
- `<leader>tr` - Rename file
- `<leader>td` - Go to source definition

### 4. **Package Management**
`package-info.nvim` untuk package.json:
- `<leader>ns` - Show package versions
- `<leader>nt` - Toggle package versions
- `<leader>nu` - Update package
- `<leader>nd` - Delete package
- `<leader>ni` - Install new package
- `<leader>np` - Change package version

### 5. **NPM Scripts**
Run npm scripts langsung dari Neovim:
- `<leader>nr` - Run NPM script
- `<leader>nx` - Stop NPM script

### 6. **Live Server**
Preview HTML/CSS/JS live di browser:
- `<leader>ls` - Start Live Server
- `<leader>lx` - Stop Live Server

### 7. **REST Client**
Test API langsung dari Neovim (file `.http`):
- `<leader>rr` - Run REST request
- `<leader>rp` - Preview REST request
- `<leader>rl` - Re-run last request

### 8. **Color Tools**
- **Color Picker** (`<leader>cp`) - Color picker GUI
- **Color Converter** (`<leader>cc`) - Convert color formats
- **Color Highlighter** (`<leader>ch`) - Toggle inline color preview
- **Auto highlight** - RGB, HEX, HSL, Tailwind colors

### 9. **Markdown Preview**
Live preview Markdown & MDX:
- `<leader>mp` - Start Markdown Preview
- `<leader>ms` - Stop Markdown Preview
- `<leader>mt` - Toggle Markdown Preview

### 10. **JSON Tools**
- `<leader>jq` - JQ Query (filter JSON)
- `<leader>jf` - Format JSON

### 11. **Auto Import**
- `<leader>im` - Auto import module/package

### 12. **Emmet**
- `<leader>xe` - Wrap dengan Emmet abbreviation
- Contoh: ketik `div.container>ul>li*3` lalu `<leader>xe`

### 13. **Auto Tag**
HTML/JSX tags otomatis ter-rename & ter-close:
- Auto close tags: `<div>` → `<div></div>`
- Auto rename: rename `<div>` otomatis update `</div>`

### 14. **Syntax Highlighting**
Treesitter parsers untuk:
- HTML, CSS, SCSS, JavaScript, TypeScript, JSX, TSX
- Vue, Svelte, Astro
- JSON, YAML, TOML
- GraphQL, Prisma
- Markdown, MDX

## 📦 Tools yang Ter-install Otomatis

### Formatters:
- Prettier (+ daemon version untuk speed)
- Stylua (Lua)
- Taplo (TOML)
- Prisma Formatter

### Linters:
- ESLint (daemon version)
- Stylelint (CSS)
- JSONLint

### Debuggers:
- JavaScript Debug Adapter

## 🎯 Workflow Web Development

### 1. **Develop React/Vue/Svelte App**
```bash
# Buka project
cd my-project
nvim .

# Install dependencies jika belum
<leader>ni

# Format code otomatis on save ✓
# Auto-complete dengan LSP ✓
# Import management ✓
```

### 2. **Organize Imports (TypeScript)**
```typescript
// File berantakan dengan imports
import { useState } from 'react';
import axios from 'axios';
import { Button } from './components';

// Tekan <leader>to untuk organize
// Tekan <leader>tu untuk remove unused imports
```

### 3. **Tailwind CSS Development**
```html
<!-- Auto-complete class Tailwind -->
<div class="flex items-center justify-|">
                                    ^ autocomplete muncul
```

### 4. **HTML dengan Emmet**
```
Ketik: nav>ul>li*5>a
Tekan: <leader>xe
Hasil:
<nav>
  <ul>
    <li><a href=""></a></li>
    <li><a href=""></a></li>
    <li><a href=""></a></li>
    <li><a href=""></a></li>
    <li><a href=""></a></li>
  </ul>
</nav>
```

### 5. **API Testing**
```http
# file: api.http
GET https://api.github.com/users/yourusername
```
Tekan `<leader>rr` untuk run request

### 6. **Color Picker**
```css
.button {
  background: #3b82f6; /* Kursor di sini, tekan <leader>cp */
}
```

## 🔧 Kustomisasi

### Disable Auto-format
```lua
-- Disable globally
vim.g.disable_autoformat = true

-- Disable per buffer
vim.b.disable_autoformat = true
```

### Custom Prettier Config
Buat file `.prettierrc` di root project:
```json
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 100
}
```

### Custom ESLint Config
Buat file `.eslintrc.json` di root project:
```json
{
  "extends": ["eslint:recommended", "plugin:react/recommended"],
  "rules": {
    "semi": ["error", "always"]
  }
}
```

## 📚 Resources

- [Lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [LSP Config](https://github.com/neovim/nvim-lspconfig) - LSP configurations
- [Mason](https://github.com/williamboman/mason.nvim) - LSP/Tool installer
- [Conform.nvim](https://github.com/stevearc/conform.nvim) - Formatter
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting

## 🎨 Tips & Tricks

1. **Quick Format**: `<leader>f` untuk format file saat ini
2. **Go to Definition**: `gd` untuk jump ke definisi
3. **Show References**: `gr` untuk lihat semua references
4. **Rename Symbol**: `<leader>rn` untuk rename variable/function
5. **Code Action**: `<leader>ca` untuk quick fixes
6. **View Diagnostics**: `<leader>d` untuk lihat error/warning detail
7. **Next/Prev Diagnostic**: `]d` dan `[d`
8. **Hover Documentation**: `K` untuk lihat docs
9. **Auto Import**: `<leader>im` untuk import yang missing

## 🚨 Troubleshooting

### LSP tidak jalan?
```vim
:Mason
" Check apakah semua LSP servers ter-install

:LspInfo
" Check LSP yang aktif di buffer saat ini
```

### Formatter tidak jalan?
```vim
:ConformInfo
" Check formatter yang tersedia
```

### Install ulang tools:
```vim
:MasonToolsUpdate
```

## 🎉 Selamat Coding!

Setup ini sudah siap untuk:
- ✅ React/Next.js development
- ✅ Vue/Nuxt development
- ✅ Svelte/SvelteKit development
- ✅ Astro development
- ✅ Static HTML/CSS/JS
- ✅ TypeScript projects
- ✅ REST API development
- ✅ Full-stack development

Happy coding! 🚀
