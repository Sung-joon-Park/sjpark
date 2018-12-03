set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	" The following are examples of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	" plugin on GitHub repo
	Plugin 'tpope/vim-fugitive'
	" plugin from http://vim-scripts.org/vim/scripts.html
	Plugin 'L9'
	" Git plugin not hosted on GitHub
	Plugin 'git://git.wincent.com/command-t.git'
	" git repos on your local machine (i.e. when working on your own plugin)
	Plugin 'file:///home/gmarik/path/to/plugin'
	" The sparkup vim script is in a subdirectory of this repo called vim.
	" Pass the path to set the runtimepath properly.
	Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	" Avoid a name conflict with L9
	Plugin 'user/L9', {'name': 'newL9'}

	Plugin 'AutoComplPop'  "Auto complete Plugin
	Plugin 'nerdtree'
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

	"F
"colorscheme hybrid
colorscheme molokai

let g:molokai_original = 1
" Handle TERM quirks in vim
if $TERM =~ '^screen-256color'
    set t_Co=256
    nmap <Esc>OH <Home>
    imap <Esc>OH <Home>
    nmap <Esc>OF <End>
    imap <Esc>OF <End>
endif
set autoindent
set smartindent
set cindent
if has("syntax")
    syntax on
endif
set nu
set ts=4
set shiftwidth=4 " 자동인덴트
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

set laststatus=2 " 상태바 표시를 항상한다
set hlsearch
set showmatch "일치하는 괄호쌍 하이라이팅 
set smartcase " 검색시 대소문자 구분  

set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\ 

"------------------------------------"
"Ctags"
set tags=tags;
"------------------------------------"
"CSCOPE
set csprg=/usr/bin/cscope
set csto=0 "cscopetagorder, determines the order :cstag
set cst "cscopetag, cscope for tag commands.
function! LoadCscope()
 let db = findfile("cscope.out", ".;")
 if (!empty(db))
 let path = strpart(db, 0, match(db, "/cscope.out$"))
 set nocscopeverbose " suppress 'duplicate connection' error
 exe "cs add " . db . " " . path
 set cscopeverbose
 endif
endfunction
au BufEnter /* call LoadCscope()
"------------------------------------------"
"Taglist
filetype on

nmap <F4> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <F5> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F6> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 55
let Tlist_Inc_winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1
let Tlist_Display_Tag_Scope = 1  "display tag scope
"let Tlist_Display_Prototype = 1 "display Prototype
"SourceExplroer
map <F8> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 50 "50ms refresh
let g:SrcExpl_jmpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

"NERD TREE

let NerdTreeWinPos = "left"
let NERDTreeShowHidden=1 "display hidden files!
nmap <F9> :NERDTreeToggle<CR>

"let g:EasyGrepCommand=1

set background=dark

"hi LineNr  guifg=#858280 guibg=#232323 gui=NONE
"highlight LineNr ctermfg=grey 

"highlight LineNr ctermfg=grey

"set term=xterm
"
"For highlight


