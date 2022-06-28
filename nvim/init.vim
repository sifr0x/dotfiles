set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set hidden
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set list
set listchars=tab:>-,trail:·,nbsp:·,extends:>,precedes:<

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'onsails/lspkind-nvim'
Plug 'glepnir/lspsaga.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'preservim/vim-colors-pencil'

Plug 'tpope/vim-sleuth'
Plug 'darrikonn/vim-gofmt'

Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-commentary'

Plug 'AndrewRadev/switch.vim'
Plug 'tpope/vim-speeddating'

" Git stuff
Plug 'tpope/vim-fugitive'
call plug#end()

lua require("sifr0x")

colorscheme pencil

let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" Terminal commands
" ueoa is first through fourth finger left hand home row.
" This just means I can crush, with opposite hand, the 4 terminal positions
"
" These functions are stored in harpoon.  A plugn that I am developing
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><C-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><C-t> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><C-n> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><C-s> :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap <silent><leader>n :lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent><leader>p :lua vim.lsp.diagnostic.goto_prev()<cr>

" Don't use default mappings
let g:speeddating_no_mappings = 1

" Avoid issues because of us remapping <c-a> and <c-x> below
nnoremap <Plug>SpeedDatingFallbackUp <c-a>
nnoremap <Plug>SpeedDatingFallbackDown <c-x>

" Manually invoke speeddating in case switch didn't work
nnoremap <c-a> :if !switch#Switch() <bar>
      \ call speeddating#increment(v:count1) <bar> endif<cr>
nnoremap <c-x> :if !switch#Switch({'reverse': 1}) <bar>
      \ call speeddating#increment(-v:count1) <bar> endif<cr>
