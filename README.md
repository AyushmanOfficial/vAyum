# 🌀 vAyum - Just a fast, modular Neovim setup.

**vAyum** (inspired by *Vayu* the wind) is my personal Neovim "distro", It’s built to be snappy, look clean, and stay out of your way while you’re actually trying to code. 

I’m currently running about **28 plugins**, but the startup is still instant. Its got a heavy focus on the "Folke Industries™" (Snacks, Noice, Trouble) and uses the newer `blink.cmp` for completion because it's just faster.

---

## 📑 Index

- [🚀 Quick Start](#-quick-start)
- [⚙️ Stuff You Need](#%EF%B8%8F-stuff-you-need)![Uploading blazingly-fast.svg…]()

- [✨ What's Inside](#-whats-inside)
- [🧩 Plugin List](#-plugin-list)

---

## 🚀 Quick Start

> [!CAUTION]
> Don't be that person **backup your current config** before you run this. 

```bash
# Backup Existing Config (if any)
mv ~/.config/nvim/ ~/.config/nvim-backup

# Clone the damn repo
git clone https://github.com/ayushmanofficial/vAyum ~/.config/nvim

# Just open nvim and let lazy.nvim do its thing
nvim
```

---

## ⚙️ Stuff You Need

* **Neovim 0.10+** (Seriously, don't try this on 0.9. It'll probably break.)
* **Nerd Fonts** (I use JetBrainsMono, but anything from NerdFonts works for the icons.)
* **Git & Terminal** with TrueColor support.
* **Ripgrep** (Required for Telescope to actually find stuff.)

---

## ✨ What's Inside

* **Blink.cmp**: Replaced the old nvim-cmp. It’s much more stable and feels way more responsive.
* **The "Vibes"**: Native support for **Catppuccin** and **Tokyonight**. Plus, I added `transparent.nvim` because I like seeing my wallpaper while I suffer through bugs.
* **Snacks & Noice**: Keeps the UI looking modern. No more ugly command bars at the bottom... Noice!
* **LSP & Mason**: Everything is pre-configured for JS/TS, React, and Lua. Mason handles the heavy lifting for installing servers.
* **Modular**: I’ve split the config up so it's easy to go in and tweak things without breaking the whole thing.

---

## 🧩 Plugin List

Here is the current breakdown of the **28 plugins** I'm using:

### UI & Aesthetics
* `catppuccin` & `tokyonight.nvim` (The goats)
* `lualine.nvim` (Status bar)
* `bufferline.nvim` (Tabs at the top)
* `noice.nvim` + `nui.nvim` (Modern UI)
* `transparent.nvim` (Ghost mode)
* `snacks.nvim` (Better dashboard/notifs)

### Navigation & Search
* `telescope.nvim` (Fuzzy finder)
* `which-key.nvim` (For when you forget your keybinds)
* `gitsigns.nvim` (Git status in the gutter)
* `trouble.nvim` (A better way to see errors)
* `todo-comments.nvim` (Finds all your `TODO` and `FIXME` tags)

### Coding & Performance
* `blink.cmp` (The new king of completion)
* `nvim-lspconfig` (Standard LSP setup)
* `mason.nvim` & `mason-lspconfig` (Plugin/LSP manager)
* `conform.nvim` (Auto-formatting on save)
* `nvim-treesitter` (Syntax highlighting that actually works)
* `friendly-snippets` (Pre-made code snippets)
* `web-tools.nvim` (Hacking on web stuff)

---

*Built with ❤️ and way too much autism.*
