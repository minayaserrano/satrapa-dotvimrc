set nocompatible                " choose no compatibility with legacy vi


"" Setting up Vundle - the vim plugin bundler
"" Stolen ;) from http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif


filetype off                    " vundle required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'

" Vombato color scheme
Bundle 'molok/vim-vombato-colorscheme'
" Wombat256 color scheme
Bundle 'vim-scripts/wombat256.vim'
" TextMate Snippets
Bundle 'msanders/snipmate.vim'
" Insert use statements automatically
Bundle 'arnaud-lb/vim-php-namespace'
" Symfony stuff
Bundle 'docteurklein/vim-symfony'
" PHPUnit support
Bundle 'docteurklein/vim-phpunit'
" PHP5.4 support
Bundle 'shawncplus/php.vim'
" NERDTree
Bundle 'scrooloose/nerdtree'
" Twig support
Bundle 'evidens/vim-twig'
" HTML snippets
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Surround with parentheses, brackets, quotes, tags...
Bundle 'tpope/vim-surround'
" Groovy support
Bundle 'vim-scripts/groovy.vim'
" Sintax checking
Bundle 'scrooloose/syntastic'
" Full path finder
Bundle 'kien/ctrlp.vim'
" Better statusline
"Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/powerline'
" Git support
Bundle 'tpope/vim-fugitive'
" Git diff changes
Bundle 'airblade/vim-gitgutter'
" Better Markdown support
Bundle 'tpope/vim-markdown'

" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'

" Jinja vim
Bundle 'Jinja'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" 
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
"" Setting up Vundle - the vim plugin bundler end


set number                      " Show line numbers
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set hidden                      " no need save to change buffer
filetype plugin indent on       " load file type plugins + indentation


"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Colors
set background=dark
set t_Co=256
if has("gui_running")
    colorscheme vombato
else
    colorscheme wombat256mod
endif

" phpunit compilation
com! -nargs=* Phpunit make -c app <q-args> | cw

" php man pages
" press K on a phpfunction to see the magic
" You need install doc.php.net/pman through
" pear install doc.php.net/pman
set keywordprg=pman

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif    " Open NERDTree on vim starts up if no files were specified
map <F2> :NERDTreeToggle<CR>                       " Crtl+n to open NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif  " Close vim if only NERDTree

" Powerline
set laststatus=2   " Always show the statusline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
