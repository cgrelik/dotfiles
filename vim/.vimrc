set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'sjl/badwolf'
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'thoughtbot/vim-rspec'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-dispatch'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/vimfiler.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elixir-editors/vim-elixir'

call plug#end()
syntax enable
syntax on
filetype on
filetype plugin on
filetype indent on

" Airline
let g:airline_powerline_fonts = 1

colorschem badwolf
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set bg=dark
set nowrap
set expandtab
set number
set cursorline
set showcmd
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=6
nnoremap <space> za
set foldmethod=indent
set t_ut=
set guioptions-=e
set sessionoptions+=tabpages,globals
set autoread
set clipboard=unnamed

set laststatus=2
set t_Co=256
set guifont=SourceCodePro+Powerline+Awesome\ Regular
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1

let g:taboo_tab_format = " %N|%f%m "
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_haml_checkers = [ 'haml_lint' ]

highlight ExtraWhitespace ctermbg=028 guibg=darkblue

let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)

let g:EasyMotion_smartcase = 1

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0
let g:rspec_command = "!bundle exec rspec -- {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>p :call RunLastSpec()<CR>

autocmd FileType ruby compiler ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileTYpe ruby let g:rubycomplete_include_object = 1
autocmd FileTYpe ruby let g:rubycomplete_include_objectspace = 1
autocmd Filetype ruby,eruby let g:rubycomplete_use_bundler = 1

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if has("gui_running")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    set guifont=SourceCodePro+Powerline+Awesome\ Regular
  endif
endif
