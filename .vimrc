execute pathogen#infect()
syntax enable
"set ai         "auto indent
set smartindent
colorscheme badwolf 
set tabstop=4
set softtabstop=4
set number
set showcmd
set cursorline
filetype plugin indent on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1
" Make the tab line lighter than the background.
let g:badwolf_tabline = 2

"------------------------------------------------
"Tag List
"------------------------------------------------
nmap <F7> :TlistToggle<CR>
let Tlist_Auto_Open = 0
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Show_One_File = 0
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_SingleClick=1
let Tlist_Process_File_Always=0

"------------------------------------------------
"Source Explorer
"------------------------------------------------
nmap <F8> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

let g:SrcExpl_winHeigt = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

"------------------------------------------------
"Nerd Tree
"------------------------------------------------
let NERDTreeWinpos = "left"
nmap <F9> :NERDTreeToggle<CR>

"------------------------------------------------------------
set fileencodings=gb2312,utf-8
set fileencoding=gb2312
set termencoding=utf-8

"----------------------------------------------------------
" jedi-vim options
"----------------------------------------------------------
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

"---------------------------------------------------------
"ctags database path
"---------------------------------------------------------
":set tags=/home/fengxiao/work/linux-4.2.5/tags
:set tags=tags

"---------------------------------------------------------
"cscope database path
"---------------------------------------------------------
if has("cscope")
	set csprg=/usr/bin/cscope                                                                "cscope location                         
	"use both cscope and ctags
	set cscopetag
	set csto=0                                                                               "cscope DataBase search first
	"cs add /home/fengxiao/work/linux-4.2.5/cscope.out /home/fengxiao/work/linux-4.2.5
	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

	"--------------------------------------------------------------------
	"   's'   symbol: find all references to the token under cursor
	"   'g'   global: find global definition(s) of the token under cursor
	"   'c'   calls:  find all calls to the function name under cursor
	"   't'   text:   find all instances of the text under cursor
	"   'e'   egrep:  egrep search for the word under cursor
	"   'f'   file:   open the filename under cursor
	"   'i'   includes: find files that include the filename under cursor
	"   'd'   called: find functions that function under cursor calls
	"--------------------------------------------------------------------
	"hit 'CTRL-\',followed by one of the cscope search types above,the result of
	"search will displayed in the current window.use 'CTRL-T' to go back
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

	"show msg when any other cscope db added
	set cscopeverbose
endif

"if has('cscope')
"	set cscopetag cscopeverbose
"
"	if has('quickfix')
"		set cscopequickfix=s-,c-,d-,i-,t-,e-
"	endif
"	command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
"endif
"----------------------------------------------------------------------------
cnoreabbrev csa cs add
cnoreabbrev csf cs find
cnoreabbrev csk cs kill
cnoreabbrev csr cs reset
cnoreabbrev css cs show
cnoreabbrev csh cs help
