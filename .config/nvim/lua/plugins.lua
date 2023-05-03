local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'sheerun/vim-wombat-scheme'
    use 'sbdchd/neoformat'

    use({
      'neovim/nvim-lspconfig',
      config = get_setup('lsp')
    })

    use({
      'hrsh7th/nvim-cmp',
      config = get_setup('cmp')
    })
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use({
      'nvim-tree/nvim-tree.lua',
      requires = {'nvim-tree/nvim-web-devicons'},
      config = get_setup('nvim-tree')
    })

    use({
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    })

    use({
      'nvim-treesitter/nvim-treesitter',
      config = get_setup("treesitter"),
      run = ":TSUpdate",
    })

    use({
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = get_setup('telescope')
    })

    use 'kyazdani42/nvim-web-devicons'
    use({
      "nvim-lualine/lualine.nvim",
      config = get_setup("lualine"),
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use({
      "ViViDboarder/wombat.nvim",
      requires = { 'rktjmp/lush.nvim' }
    })

    use({
      'terrortylor/nvim-comment',
      config = get_setup("nvim-comment")
    })

    use({
      'vim-test/vim-test',
      config = get_setup('vim-test')
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end
})
