set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Indent manager for python
Plugin 'vim-scripts/indentpython.vim'

" AutoCompleter
Bundle 'Valloric/YouCompleteMe'

" Syntax Checker
Plugin 'vim-syntastic/syntastic'

" PEP 8 Checking
Plugin 'nvie/vim-flake8'

" Colors
Plugin 'jnurmine/Zenburn'
Plugin 'ayu-theme/ayu-vim'

" Python3 VirtualEnv support
Plugin 'plytophogy/vim-virtualenv'

" In-Editor Tree View
Bundle 'scrooloose/nerdtree'

" Status Bar
Plugin 'itchyny/lightline.vim'

" Comment Selected Text
Plugin 'tpope/vim-commentary'

" Surround Text with Anything
Plugin 'tpope/vim-surround'

" PHP Syntax
Plugin 'stanangeloff/php.vim'

" PHP Indenting
Plugin '2072/PHP-Indenting-for-VIm'

" PHP CodeSniffer Fixer
Bundle 'stephpy/vim-php-cs-fixer'

" Asynchronously run programs
Plugin 'neomake/neomake'

" php autocomplete
Plugin 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" js syntax highlighting
Plugin 'pangloss/vim-javascript'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen

"Find whitespace that could cause issues
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*php,*.inc.php match BadWhitespace /\s\+$/

" General file spacing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

syntax off

au BufNewFile,BufRead *.cpp,*.h,*.c,*hpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set encoding=utf-8 |
    \ set colorcolumn=80 |
    \ syntax on |

" vim settings for py files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set encoding=utf-8 |
    \ syntax on |
let python_highlight_all=1 

au BufNewFile,BufRead *.php
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set encoding=utf-8 |
    \ set colorcolumn=80 |
    \ syntax on |

" vim settings for js, html and css files
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ syntax on |


" Make sure YCM autocompleter window closes
let g:ycm_autoclose_preview_window_after_completion=1

" Change leader key
map <Space> <leader>

" Goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()
"au BufRead,BufNewFile *py,*pyw,*.c,*.h match ExtraWhitespace /\s\+$/

set t_Co=256
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  set termguicolors
  let ayucolor="mirage"
  colorscheme ayu
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color GNU screen.
  set t_ut=
endif

if &term =~ 'kitty'
  "let &t_ut=''
  set t_ut=
endif


" Ctrl+n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Enable statusline
set laststatus=2

" Disable Default Insert Notification
set noshowmode

" PHP-CS-FIXER keybinds
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

" PHP-CS-FIXER options
" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer" 

" If you use php-cs-fixer version 1.x
" let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
" let g:php_cs_fixer_config = "default"                  " options: --config
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
"let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
" End of php-cs-fixer version 1 config params

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.


" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

let g:ycm_server_python_interpreter = "/usr/bin/python"
