-- Define base46_cache variable
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

-- Set mapleader to space
vim.g.mapleader = " "

-- Install lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- Load plugins
local lazy_config = require "configs.lazy"

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  {'neoclide/coc.nvim', branch = 'release', dependencies = { 'nvim-lspconfig' }, lazy = true},
  {'hrsh7th/cmp-nvim-lsp', lazy = true},
  {'hrsh7th/cmp-buffer', lazy = true},
  {'hrsh7th/cmp-path', lazy = true},
  {'hrsh7th/cmp-cmdline', lazy = true},
  {'hrsh7th/nvim-cmp', lazy = true},

  { import = "plugins" },
}, lazy_config)

-- Configure coc.nvim
vim.g.coc_global_extensions = {
  'coc-python',
  'coc-java',
  'coc-css',
  'coc-html',
  'coc-tsserver',
  'coc-json',
  'coc-eslint',
  'coc-discord-rpc',
}

-- Load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

-- Autocmd to load Coc on BufNewFile event
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- This will be executed when all plugins are loaded
    -- You can put your coc.nvim initialization code here
    vim.cmd("Lazy load coc.nvim")
  end,
})

-- Autocmd to load Coc on BufReadPost event
vim.schedule(function()
  require "mappings"
end)
