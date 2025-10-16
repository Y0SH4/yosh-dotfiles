# Troubleshooting Guide

## Syntax Highlighting Tidak Muncul (HTML, CSS, JS)

### Solusi 1: Install Treesitter Parser Manual

Buka Neovim dan jalankan:

```vim
:TSInstall html
:TSInstall css
:TSInstall javascript
:TSInstall typescript
```

Atau install semua sekaligus:

```vim
:TSInstall html css javascript typescript tsx jsx json
```

### Solusi 2: Update Treesitter

```vim
:TSUpdate
```

### Solusi 3: Check Status Treesitter

```vim
:checkhealth nvim-treesitter
```

Lihat apakah ada parser yang error atau belum ter-install.

### Solusi 4: Reinstall Semua Parser

```vim
:TSInstall! html css javascript typescript
```

Tanda `!` akan force reinstall.

### Solusi 5: Check File Type

Pastikan Neovim mendeteksi file type dengan benar:

```vim
:set filetype?
```

Untuk HTML seharusnya output: `filetype=html`

Jika tidak, set manual:

```vim
:set filetype=html
```

### Solusi 6: Clean & Reinstall

Jika masih tidak work, clean cache dan reinstall:

```bash
# Keluar dari Neovim
# Hapus cache Treesitter
rm -rf ~/.local/share/nvim/lazy/nvim-treesitter

# Buka Neovim lagi
nvim

# Install parser
:TSInstall html css javascript typescript
```

---

## Plugin Error Saat Install

### Error: rest.nvim atau npm-scripts.nvim

Plugin ini sudah dihapus dari config karena dependency issues.

Untuk menghapus sisa-sisa error:

```bash
rm -rf ~/.local/share/nvim/lazy/rest.nvim
rm -rf ~/.local/share/nvim/lazy/npm-scripts.nvim
rm -rf ~/.local/share/nvim/lazy-rocks/rest.nvim
```

Lalu buka Neovim dan run:

```vim
:Lazy clean
:Lazy sync
```

---

## LSP Tidak Jalan

### Check LSP Status

```vim
:LspInfo
```

### Install LSP Server Manual

```vim
:Mason
```

Di window Mason, tekan:
- `i` - Install
- `u` - Update
- `X` - Uninstall

Cari server yang dibutuhkan (contoh: `html`, `cssls`, `ts_ls`)

### Restart LSP

```vim
:LspRestart
```

---

## Formatter Tidak Jalan

### Check Formatter Status

```vim
:ConformInfo
```

### Install Prettier Manual

```bash
npm install -g prettier
```

Atau via Mason:

```vim
:Mason
# Search "prettier" dan tekan 'i'
```

---

## Neovim Lambat Saat Startup

### Check Plugin Load Time

```vim
:Lazy profile
```

Lihat plugin mana yang paling lama load.

### Disable Plugin Sementara

Edit `lua/plugins/init.lua`, comment plugin yang tidak dipakai:

```lua
return {
  require("plugins.ui"),
  require("plugins.lsp"),
  -- require("plugins.webdev"),  -- Disable sementara
}
```

---

## Reset Total

Jika semua cara di atas tidak work, reset total:

```bash
# Backup dulu
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup

# Copy config baru
cd ~/yosh-dotfiles/configs/nvim
ln -s $(pwd) ~/.config/nvim

# Buka Neovim
nvim

# Wait for install
# Restart
:qa
nvim
```

---

## Commands Berguna

```vim
:checkhealth                    # Check semua health
:checkhealth nvim-treesitter   # Check Treesitter
:checkhealth lsp               # Check LSP
:Lazy                          # Plugin manager
:Mason                         # LSP/Tool manager
:ConformInfo                   # Formatter info
:LspInfo                       # LSP info
:TSInstallInfo                 # Treesitter info
```
