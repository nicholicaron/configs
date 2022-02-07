scripte utf-8


" ======================== General Settings =============================
" hybrid line number toggle
:set number relativenumber
:augroup numbertoggle
:	autocmd!
:	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" " Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" No arrow keys --- force yourself to use the home row
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>"

" file explorer setting 
let g:explVertical=1
let g:explSplitRight=1
let g:explStartRight=1
let g:explWinSize=20


set clipboard=unnamed
set nocp
set all&
set report=0
set hi=100                 " size of history buffer.
set bs=indent,eol,start    " use backspace
set ru                     " always show cursor position
set sc                     " show current typing word
set nu                     " show line number
set hls                    " highlight searching word
set nows                   " go to the first searching word at the end of searching (disable)
set ic                     " ignore case sensitive
set scs                    " enable smart case sensitive 
set ls=2                   " always show the status line
set ai                     " auto indentation
set background=dark        " set background color dark
set si                     " smart indentation
set wmnu                   " show the list of candidates when using tab autocomplete 
set lz                     " disable to update display while using macro
set lpl                    " load plugins when startup
set wildignorecase         " Ignore the case sensitive when using tab autocompletion"
set autoread               " Automatically update the new change in the buffer.
set cino=N-s               " c++ namespace indentation

set t_Co=256

set noswapfile 

set ffs=unix,dos,mac

" tab size
set ts=4
set sw=4

" encoding setting
set enc=utf8
set fenc=utf-8
set fencs=ucs-bom,utf-8,cp949,latin1

" font setting
set guifont=Hack\ 11
set guifontwide=Dotumche\ 11

" hide toolbar, menubar
set guioptions-=T
set guioptions-=m

" tab <==> space change (disabled)
set noet
set sts=0

" disable auto line changing
"set nowrap

" enable auto indentation
set autoindent
set cindent
 
" set the size of gvim
if has("gui_running")
   set lines=50
   set co=125
endif
 
filetype on

" auto recognize the file type
filet plugin indent on

" TBA
filetype plugin on

" Disable automatically insert comment.
au FileType c,cpp,rs setlocal comments-=:// comments+=f://  

"" Read arduino .ino 
"au BufRead,BufNewFile *.pde set filetype=pde
"au BufRead,BufNewFile *.ino set filetype=arduino

"" Read ROS launch file.
"au BufRead,BufNewFile *.launch set filetype=xml

augroup CursorLine
        au!
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        au WinLeave * setlocal nocursorline
augroup END


" ======================== Custom Functions =============================
" Print current working file name.
function! Cwd(...)
	echo expand('%:p')
endfunction
command! -bar Cwd call Cwd()

" Quit all other windows except for the NERD-tree
function! OnlyAndNerdtree()
    let currentWindowID = win_getid()
    windo if win_getid() != currentWindowID && &filetype != 'nerdtree' | close | endif
endfunction
command! Only call OnlyAndNerdtree()


" ======================== General Mapping =============================
" tmux-vim ABCD error fix
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi

" { + Enter to make auto other parenthesis.
inoremap {<CR> {<CR>}<C-o>O
inoremap {<Tab> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap (<Tab> (<CR>)<C-o>O
"Line below **
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u       

" Delete key in insert mode.
imap <C-D> <Del>

" Undo in insert mode.
imap <C-Z> <ESC>ua

" Delete the previous word.
imap <C-R> <ESC>ldbi

" Print current file path.
nmap <C-P> :Cwd<CR>

" Quit other windows except for the NERD-tree
nmap <C-Q> :Only<CR>

" Disable highlighted search word.
nmap t :let @/=""<CR>

" \s press \s on the word you want to replace
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" buffer switching
map <silent> <C-Left> <c-w>h
map <silent> <C-Down> <c-w>j
map <silent> <C-Up> <c-w>k
map <silent> <C-Right> <c-w>l
map <silent> <C-H> <c-w>h
map <silent> <C-J> <c-w>j
map <silent> <C-K> <c-w>k
map <silent> <C-L> <c-w>l

" Moving cursor in insert mode. 
autocmd VimEnter * imap <C-W> <ESC>wa
imap <C-B> <ESC>ba
autocmd VimEnter * imap <C-H> <ESC>ha
imap <C-J> <ESC>ja
imap <C-K> <ESC>ka
imap <C-L> <ESC>la

"" forward, backward paragraph motion
map . {
map , }

" Go to the end of the line.
imap <C-E> <ESC>A
nnoremap <C-E> A<ESC>

" Go to the beginning of the line.
map <ESC>e <A-E>
imap <A-E> <ESC>I
nnoremap <A-E> I<ESC>

" New line
nnoremap <C-O> O<Esc>
nnoremap <C-F> o<Esc>
imap <C-O> <ESC>O
imap <C-F> <ESC>o

" Hit enter in normal mode.
nnoremap <CR> i<CR><Esc>  

" Resize the window.
nnoremap <silent> <C-C><C-C> :exe "vertical resize " . (winwidth(0) * 11/10)<CR>
nnoremap <silent> <C-C><C-V> :exe "resize " . (winheight(0) * 11/10)<CR>

" redo
nmap U :redo<CR>

" Quit without saving.
nnoremap Q ZQ

" Automatically close the quickfix window after done using.
autocmd FileType qf nnoremap <buffer> <Enter> <Enter>:cclose<CR>

" ======================== Plugin Mapping =============================
" mark and unmark
map <F4> <Plug>MarkClear        
map <F5> <Plug>MarkSet         

" Nerdtree 
nmap <C-N> :NERDTreeToggle<CR> 
nnoremap <leader>z :NERDTreeFind<CR>

" Tagbar
nmap <C-T> :Tagbar<CR>            

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
	  " git gutter for macosx
	  map <leader>gr <Plug>(GitGutterUndoHunk)<CR>
	  map <leader>gn <Plug>(GitGutterNextHunk)<CR>
	  map <leader>gp <Plug>(GitGutterPrevHunk)<CR>
  else
	  " git gutter for linux
	  map <leader>gr <Plug>GitGutterUndoHunk<CR>
	  map <leader>gn <Plug>GitGutterNextHunk<CR>
	  map <leader>gp <Plug>GitGutterPrevHunk<CR>
  endif
endif

" vim-airline buffer control.
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>
nnoremap <leader>c :bp\|bd #<CR><CR>


" ======================== Plugin Settings =============================
" nerdtree position
let NERDTreeWinPos = "left"
let NERDTreeQuitOnOpen=0

" vim-airline
set laststatus=2 " turn on bottom bar
let g:airline#extensions#tabline#enabled=1       " turn on buffer list
let g:airline#extensions#tabline#fnamemod=':t'   " show only filename
let g:airline_theme='icebergDark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline_powerline_fonts=1

" Indent guide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1



setlocal spell
set spelllang=en_us


" ======================== Plugins =============================
set nocompatible
filetype off
 
set rtp+=~/.vim/bundle/Vundle.vim/
 
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'             
Plugin 'The-NERD-tree'                    " File browser
Plugin 'ctags.vim'                        " Function navigaion
Plugin 'snipMate'                         " Snippet
Plugin 'tComment'                         " C+_ C+_ block comment.
Plugin 'EasyMotion'                       " \w, \b to fast navigation.
Plugin 'AutoClose'                        " [] {} Automatic parenthesis. {} ()
Plugin 'Mark'                             " F4, F5 to mark.
Plugin 'majutsushi/tagbar'                " Function navigation.
Plugin 'nathanaelkane/vim-indent-guides'  " Indentation
Plugin 'vim-airline/vim-airline'          " Airline for decoration of vim.
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'           " Git changelog tracker.
Plugin 'tpope/vim-fugitive'               " vim with git command(e.g., Gdiff)
Plugin 'gkeep/iceberg-dark'
Plugin 'cocopon/iceberg.vim'

"LaTex stuff
"Plugin 'lervag/vimtex'
"	let g:tex_flavor='latex'
"	let g:vimtex_view_method='mupdf'
"	let g:vimtex_quickfix_mode=0
"Plugin 'sirver/ultisnips.vim'
"	let g:UltiSnipsExpandTrigger = '<tab>'
"	let g:UltiSnipsJumpForwardTrigger = '<tab>'
"	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"Plugin 'KeitaNakamura/tex-conceal'
"	set conceallevel=1
"	let g:tex_conceal='abdmg'
"	hi Conceal ctermbg=none

"VIM enhancements
Plugin 'ciaranm/securemodelines'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'justinmk/vim-sneak'

" GUI enhancements
Plugin 'itchyny/lightline.vim'
Plugin 'andymass/vim-matchup'
Plugin 'machakann/vim-highlightedyank'

" Fuzzy finder
Plugin 'airblade/vim-rooter'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Syntactic language support
Plugin 'cespare/vim-toml'
Plugin 'stephpy/vim-yaml'
Plugin 'rust-lang/rust.vim'
Plugin 'dense-analysis/ale'


Plugin 'rhysd/vim-clang-format'
Plugin 'dag/vim-fish'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


call vundle#end()

" ======================== Special Settings =============================
colorscheme iceberg 
syntax enable
filetype plugin indent on

autocmd BufNewFile,BufRead *.rs set filetype=rust

let g:ale_linters = {
\	'rust': ['analyzer'],
\}

let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }

let g:rustfmt_autosave = 1

" Optional, configure as-you-type completions
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>


set whichwrap+=h,l,<,>   " auto line switching at the end of line
