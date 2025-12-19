# org-cycle-lite.nvim

This plugin replaces default cycling with a simpler version, implementing the [org-cycle-only-current-subtree-h](https://github.com/doomemacs/doomemacs/blob/master/modules/lang/org/autoload/org.el#L497) functionality of Doom Emacs, disabling the show-all stage of org-cycle.

This forces cycling only between folded → children visible → folded, without revealing the full subtree, which can make browsing notes faster for some workflows.

This plugin is an extension intended for use with [orgmode.nvim](https://github.com/kristijanhusak/orgmode.nvim)

## Features

- Toggle fold for the current headline or subheadlines.
- Works with `nvim-orgmode` files (`*.org`).
- Lightweight and minimal, no subtree expansion by default.
- Supports configurable keymaps.
- Compatible with all major Neovim plugin managers.

## Installation

Make sure you have [nvim-orgmode](https://github.com/nvim-orgmode/orgmode) installed before using this plugin.

### Using Lazy.nvim

```lua
-- init.lua or plugins.lua
require("lazy").setup({
  "aaratha/org-cycle-lite.nvim",
  config = function()
    require("org-cycle-lite").setup({
      keymap = "<TAB>",  -- Optional: change keymap
    })
  end,
})
```

### Using Packer.nvim

```lua
use {
  "username/org-cycle-lite.nvim",
  config = function()
    require("org-cycle-lite").setup({
      keymap = "<TAB>",  -- Optional: change keymap
    })
  end
}
```

### Using Vim-Plug

```vim
Plug 'username/org-cycle-lite.nvim'
```

Then in lua config:

```lua
require("org-cycle-lite").setup({
  keymap = "<TAB>",  -- Optional
})
```

```

```
