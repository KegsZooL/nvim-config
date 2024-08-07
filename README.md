# My nvim config

- This configuration was based on the gruvbox style

![gruvbox_palette](./screenshots/gruvbox_palette_dark.png)

<style>
    .summary-h2 {
        font-size: 1.5em;
        font-weight: bold;
    }
    .summary-h3 {
        font-size: 1.0em;
        font-weight: bold;
    },
</style>

<details>
    <summary class="summary-h2";>Preview config</summary>

+   <details>
        <summary class="summary-h3">Start page</summary>
        <img src="./screenshots/dashboard.png" alt="dashboard">
    </details>

+   <details>
        <summary class="summary-h3">Main file</summary>
        <img src="./screenshots/main.png" alt="main-file">
    </details>

+   <details>
        <summary class="summary-h3">Navigation</summary>
        <img src="./screenshots//laspsaga-and-nvim-tree.png" alt="lspsaga">
        <img src="./screenshots/telescope-gc.png" alt="telescope">
        <img src="./screenshots/telescope-gs.png" alt="telescope">
        <img src="./screenshots/telescope-ff.png" alt="telescope">
        <img src="./screenshots/toggelterm.png" alt="toggelterm">
    </details>

+   <details>
        <summary class="summary-h3">Language Server Protocol support</summary>
        <img src="./screenshots/java.png" alt="LSP">
        <img src="./screenshots/gitsigns.png" alt="LSP">
        <img src="./screenshots/lsp-info-lua.png" alt="LSP">
        <img src="./screenshots/lsp-info-jdtls.png" alt="LSP">
    </details>

+   <details>
        <summary class="summary-h3">Debug Adapter Protocol client support</summary>
        <img src="./screenshots/dap-demonstration.png" alt="DAP">
    </details>

+   <details>
        <summary class="summary-h3">Preview and insert emoji/nerd font glyphs</summary>
        <img src="./screenshots/emoji.png" alt="emoji">
        <img src="./screenshots/glyphs.png" alt="emoji">
    </details>

+   <details>
        <summary class="summary-h3">Preview markdown file</summary>
        <img src="./screenshots/markdown.png" alt="markdown">
    </details>
</details>


#### 📁 Nvim File tree

```
.
├── init.lua
└── lua
    └── core
        ├── configs.lua
        ├── lazy.lua
        └── mappings.lua
    └── plugins
        ├── autopairs.lua
        ├── bufferline.lua
        ├── cmp.lua
        ├── colorizer.lua
        ├── colorscheme.lua
        ├── comment.lua
        ├── dap-ui.lua
        ├── dap-virtual-text.lua
        ├── dap.lua
        ├── dashboard.lua
        ├── emoji.lua
        ├── gitsigns.lua
        ├── indent.lua
        ├── java.lua
        ├── jdtls.lua
        ├── lspconfig.lua
        ├── lspsaga.lua
        ├── lualine.lua
        ├── mason-lspconfig.lua
        ├── mason-nvim-dap.lua
        ├── mason.lua
        ├── mini-indentscope.lua
        ├── move.lua
        ├── neotree.lua
        ├── nerdy.lua
        ├── nvim-notify.lua
        ├── surround.lua
        ├── telescope.lua
        ├── toggleterm.lua
        ├── treesitter.lua
        ├── trouble.lua
        └── whichkey.lua
└── ascii-art.lua
```

### 📜 TODO

- [x] Preview markdown
- [x] Preview and insert emoji
- [x] Preview and insert nerd font glyphs
- [ ] Description for all command/functions
- [ ] Full DAP setup
- [ ] Support for python and C#
