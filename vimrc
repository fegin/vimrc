"--------------------------------------------------------------------------- 
" System variables
"--------------------------------------------------------------------------- 
let hostname = substitute(system('hostname'), '\n', '', '')

"--------------------------------------------------------------------------- 
" Vundle/Plugins installation
"--------------------------------------------------------------------------- 
""" For Vundle and all other plugins installation.
""" See https://github.com/gmarik/Vundle.vim/README.me for more detail.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NerdTree
Plugin 'scrooloose/nerdtree'
" EasyMotion
Plugin 'Lokaltog/vim-easymotion'
" NerdCommenter
Plugin 'scrooloose/nerdcommenter'
" tagbar
Plugin 'majutsushi/tagbar'
" Tabular
Plugin 'godlygeek/tabular'
" Syntastic
Plugin 'scrooloose/syntastic'
" Vim airline
Plugin 'bling/vim-airline'
" Vim bufferline
Plugin 'bling/vim-bufferline'
" Vimproc (required by unite)
Plugin 'Shougo/vimproc.vim'
" unite
Plugin 'Shougo/unite.vim'
" multiple-cursors
Plugin 'terryma/vim-multiple-cursors'
" Color schemems
Plugin 'flazz/vim-colorschemes'
" Python-mode
" Plugin 'klen/python-mode'
" Language Tool
Plugin 'vim-scripts/LanguageTool'
" Local vimrc
Plugin 'embear/vim-localvimrc'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" fugitive
Plugin 'tpope/vim-fugitive'

" Mac only plugins
if has("unix")
    let s:uname = substitute(system("uname -s"), '\n', '', '')
    if s:uname == "Darwin"
        " vim-mediawiki-editor
        Plugin 'aquach/vim-mediawiki-editor'
    endif
endif

" ctrlp
" Plugin 'kien/ctrlp.vim'
" NeoComplcache
" Plugin 'Shougo/neocomplcache.vim'
" Vim-Snipmate
" Plugin 'plugin/vim-snipmate-mine'
" Ack
" Plugin 'mileszs/ack.vim'
" SuperTab
" Plugin 'ervandew/supertab'
" SWTC
" Plugin 'shinokada/SWTC.vim'
" Evernote plugin
" Plugin 'kakkyz81/evervim'
" Vim-Snippets
" Plugin 'honza/vim-snippets'
" UltiSnips (another snippet engine, seems to support YouCompleteMe)
" Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"--------------------------------------------------------------------------- 
" General Settings 
"--------------------------------------------------------------------------- 
filetype on             " Enable filetype detection
filetype indent on      " Enable filetype-specific indenting
filetype plugin on      " Enable filetype-specific plugins
set nocompatible        " not compatible with the old-fashion vi mode
set bs=2                " allow backspacing over everything in insert mode
set ruler               " show the cursor position all the time
set autoread            " auto read when file is changed from outside
syntax on               " syntax highlight
set hlsearch            " search highlighting
set autoindent          " auto indentation
set incsearch           " incremental search
set nobackup            " no *~ backup files
set copyindent          " copy the previous indentation on autoindenting
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab            " insert tabs on the start of a line according to context
set t_Co=256            " Set color to 256
set relativenumber      " Turn on relative and absolute number at the same time.
set number              " 
set cursorline
" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"--------------------------------------------------------------------------- 
" LANGUAGE SPECIFIC Settings
"--------------------------------------------------------------------------- 
" --- General {
set expandtab        "replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4

"folding settings
set foldmethod=syntax   "fold based on syntax 
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
"}                              
"
" --- Python {
autocmd FileType python,pyrex setlocal tabstop=4
autocmd FileType python,pyrex setlocal softtabstop=4
autocmd FileType python,pyrex setlocal shiftwidth=4
" }
" --- Makefile {
autocmd FileType Makefile set noexpandtab
" }

" --- CTAGS {
nmap <silent><F1> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . && cscope -bR<CR>
nmap <silent><F2> :!ctags -R .<CR>
"  }
"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" set leader to ,
let mapleader=","
let g:mapleader=","

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>
" open the error console
map <leader>co :botright cope<CR> 
" move to next error
map <leader>cx :cn<CR>
" move to the prev error
map <leader>cp :cp<CR>
" --- move around splits {
" move to and maximize the below split 
"map <C-J> <C-W>j<C-W>_
" move to and maximize the above split 
"map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
"nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
"nmap <c-l> <c-w>l<c-w><bar>
"set wmw=0                     " set the min width of a window to 0 so we can maximize others 
"set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab 
map <S-H> gT
" go to next tab
map <S-L> gt
" new tab
map <C-t><C-r> :tablast<CR>
" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR> 
" ,/ turn off search highlighting
map <C-l> :nohl<CR>
" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" Save file (This require disabling terimal's CTRL-S interpretation.)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1


"--------------------------------------------------------------------------- 
" Plugin SETTINGS
"--------------------------------------------------------------------------- 
"--- NerdTree {
map <C-d> :NERDTreeToggle<CR>
" }
"--- Airline {
"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t' 
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
set laststatus=2
" }
"--- UltiSnips {
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }
" --- TagBar {
" toggle TagBar with F7
nnoremap <silent> <F7> :TagbarToggle<CR> 
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1
" }
" --- Unite {
" let g:unite_source_history_yank_enable = 1
" nnoremap <C-y> :Unite history/yank<cr>
if executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <leader>jf :Unite -start-insert file_rec<CR>
nnoremap <leader>jF :Unite -start-insert file_rec/async<CR>
nnoremap <leader>jg :Unite grep:.<CR>
nnoremap <leader>jb :Unite -quick-match -start-insert buffer<CR>
"  }
"  --- YouCompleteMe {
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>jd ::YcmCompleter GoToDefinitionElseDeclaration<CR>
" }
" --- Syntastic {
let g:syntastic_check_on_open = 0
let g:ycm_show_diagnostics_ui = 0
let g:syntastic_enable_signs = 1
" }
" --- Python-mode {
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0
let g:pymode_lint_ignore = "E111,E114,E116,E265,E501,E701,W0611,W0612,C901"
let g:pymode_options=0
let g:pymode_options_max_line_length = 99
" }
" --- Local vimrc {
let g:localvimrc_ask = 0
"  }
let g:languagetool_jar = "~/workspace/LanguageTool-2.6/languagetool-commandline.jar"
" --- vim-mediawiki-editor {
let g:mediawiki_editor_url = "localhost:8888"
let g:mediawiki_editor_username = "fegin"
let g:mediawiki_editor_password = "feginwiki"
"  }


"--------------------------------------------------------------------------- 
" Misc
"--------------------------------------------------------------------------- 
" Color Scheme
set background=dark
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" let g:solarized_termcolors = 256
" let g:solarized_termtrans = 1
" colorscheme solarized
" colorscheme wombat256
colorscheme candy
" Source the private data
source ~/.vim/vimrc_private
