-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
    use ("nvim-lua/plenary.nvim")
    use ('junegunn/fzf')
    use ('junegunn/fzf.vim')
	use ('nvim-treesitter/playground')
    use ("nvim-tree/nvim-tree.lua")
    use ("szw/vim-maximizer")
	use ('mbbill/undotree')
	use ('tpope/vim-fugitive')
    use ('airblade/vim-gitgutter')
    use ('windwp/nvim-autopairs')
    use ('norcalli/nvim-colorizer.lua')
    use ('nvim-tree/nvim-web-devicons')
    use ('projekt0n/github-nvim-theme')
    use ("nvim-lua/popup.nvim")
    use ("lifer0se/ezbookmarks.nvim")
    use ("SmiteshP/nvim-navic")
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",  -- recommended, use latest release instead of latest commit
        requires = {
        "nvim-lua/plenary.nvim",
        },
        })
    use{
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        }
    use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

end)

