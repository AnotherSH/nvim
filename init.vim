" __  ____   __  _   _ _____ _____     _____ __  __ ____   ____ 
"|  \/  \ \ / / | \ | | ____/ _ \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |  _|| | | \ \ / / | || |\/| | |_) | |    
"| |  | | | |   | |\  | |__| |_| |\ V /  | || |  | |  _ <| |___ 
"|_|  |_| |_|   |_| \_|_____\___/  \_/  |___|_|  |_|_| \_\\____|
"                                                               
"                                                               
syntax on
let mapleader=" "
set number
set incsearch
set ignorecase
set smartcase
set wrap
set encoding=UTF-8
set cursorline
set list
set showcmd
set wildmenu
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap h hzz
noremap j jzz
noremap k kzz
noremap l lzz
map nl :nohl<CR>
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source ~/.config/nvim/init.vim<CR>
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
map te :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>
map tmh :-tabmove<CR>
map tml :+tabmove<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map <up> :res+5<CR>
map <down> :res-5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l
map <LEADER>H <C-w>H
map <LEADER>J <C-w>J
map <LEADER>K <C-w>K
map <LEADER>L <C-w>L
map sv <C-w>t<C-w>H
map sg <C-w>t<C-w>K
map fi :r !figlet 

call plug#begin('~/.config/nvim/plugged')

" Markdown
" If you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },'for':['markdown','vim-plug'] }
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'

" File navigation
Plug 'preservim/nerdtree'
"Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Genreal Highlighter
Plug 'jaxbot/semantic-highlight.vim'

call plug#end()

" Compile function
noremap r :call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'markdown'
		exec "MarkdownPreview"
	endif
endfunc

"=== Markdown Settings
let g:table_mode_corner='|'
source ~/.config/nvim/md-snippets.vim
autocmd BufRead,BufNewFile *.md setlocal spell

"File navigation
"NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" Genreal Highlighter
nnoremap <LEADER>s :SemanticHighlightToggle<CR>
"let s:semanticGUIColors = [ '#72d572', '#c5e1a5', '#e6ee9c', '#fff59d', '#ffe082', '#ffcc80', '#ffab91', '#bcaaa4', '#b0bec5', '#ffa726', '#ff8a65', '#f9bdbb', '#f9bdbb', '#f8bbd0', '#e1bee7', '#d1c4e9', '#ffe0b2', '#c5cae9', '#d0d9ff', '#b3e5fc', '#b2ebf2', '#b2dfdb', '#a3e9a4', '#dcedc8' , '#f0f4c3', '#ffb74d' ]

