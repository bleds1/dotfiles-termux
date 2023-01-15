"set nu
set hidden
set laststatus=0
set nobackup
set nohlsearch
set noswapfile
"set relativenumber
"set scrolloff=8
set showmatch
set smartcase 
set smartindent
set softtabstop=4
set splitbelow
set tabstop=4
set undolevels=500
set wrap

"netrw
let g:netrw_banner=0
let g:netrw_winsize=20

"Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'arzg/vim-colors-xcode'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-python/python-syntax'
Plug 'ap/vim-css-color'
Plug 'vimwiki/vimwiki'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'

call plug#end()

"Colorscheme
colorscheme xcodedarkhc

"Cursor
autocmd InsertEnter,InsertLeave * set cul!
autocmd InsertEnter * set nocul
autocmd InsertLEave * set cul

"Cursorline
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

hi LineNr ctermbg=none guibg=#000000
hi EndOfBuffer ctermbg=none guibg=#000000

"Vimwiki
".md files outside the wiki are not seen as .vimwiki
let g:vimwiki_global_ext = 0

let g:vimwiki_list = [{'path': '~/storage/shared/Documents/org/',
                    \ 'syntax': 'markdown', 'ext': '.md'}]

"Blinking block/line
let &t_SI.="\e[5 q"
let &t_EI.="\e[0 q"
let &t_SR.="\e[4 q"

"Appearance
let g:startify_custom_header = [   "NEOVIM 0.7.2"  ]
let g:startify_files_number = 5
let g:startify_lists = [ 
						\ {'header': ['Recent'],	'type': 'files'	},
						\ {'header': ['Bookmarks'], 'type': 'bookmarks' },
						\ {'header': ['  ', getcwd()], 'type': 'dir' },
    		\ ]
let g:startify_bookmarks = [ 
                        \ { 'n': '~/storage/shared/Documents/dotfiles-termux/.config/nvim/init.vim' },
                        \ { 'i': '~/storage/shared/Documents/org/0.inbox/' },
                        \ { 'j': '~/storage/shared/Documents/org/0.inbox/0.journal' },
					    \ { 't': '~/storage/shared/Documents/dotfile-termux/.tmux.conf' },
                        \ { 'o': '~/storage/shared/Documents/org/' },
						\ { 'z': '~/.zshrc' },
						\ ]

"keybinds
let mapleader = "\<Space>"
map <leader>n :bn<CR>
map <leader>p :bp<CR>
map <leader>bk :bd<CR>
map <leader>e :enew<CR>
map <leader>z :Lex<CR>
map <leader>, :Startify<CR>
map <leader>sv :source ~/.config/nvim/init.vim<CR>

"Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
