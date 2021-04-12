so ~/.vim/plugins.vim

"The latest Vim settings/options
set nocompatible 
let mapleader = ','


"--------------- Visuals -------------"
"colorscheme darkblue
colorscheme gruvbox
set background=dark
"autocmd vimenter * ++nested colorscheme gruvbox 

"set guifont=Fira_Code:h17
" Turn off pannel slide"
"set guioptions=-l
"set guioptions=-L
"set guioptions=-r
"set guioptions=-R



"--------------- Options -------------"
" enable syntax highlighting
syntax enable
" show line nubmers
set number
" set tabs to habe 4 spaces
set ts=4
" ident when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" show the matching part of the pair for [] {} and ()
set showmatch
" enable all Python syntax highlighting features
let python_highlight_all=1
" opens buffers in separate tabs
set switchbuf=useopen,usetab
" enable mause for manipulates
set mouse=a
" write when buffer switch
"set autowriteall
" set all scopes files for autocomplete
set complete=.,w,b,u,t,i




"--------------- Plugins -------------"

"---NerdTree"
" active/deactive NERDTree side bar
nmap <C-B><C-K> :NERDTreeToggle<cr>		
" replace standart edit (e .) mode.
let NERDTreeHijackNetrw = 1
"let NERDTreeIgnore=['\__pycache__$[[[dir]]']
let NERDTreeIgnore=['__pycache__$[[dir]]']

"---CtrlP---"
" activate CtrlP search panel
nmap <leader><C-P> :CtrlPBufTag<cr>
" activate CtrlP recent files panel
nmap <leader>r :CtrlPMRUFiles<cr>
" revert to default redo command"
nmap <C-R> :redo<cr>
" ignore files for searching
let g:ctrlp_custom_ignore = 'some/path|git'
" set size and lines count for crtlP search panel
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"---ALE---"
"':help ale-support', for list available linters
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['black']}
"let g:ale_fix_on_save = 1

"---ctags---"
" locate for project tags file
set tags=$VIRTUAL_ENV/mytags
" generate tags for all project file
command! GTags execute 'silent !ctags -R -f $VIRTUAL_ENV/mytags $(pwd)'
" generate tags for python lib and frameworks
command! GLibTags execute 'silent !ctags -a -R -f $VIRTUAL_ENV/mytags $VIRTUAL_ENV/lib/python*/site-packages'
" generate tags at the vim starts
augroup createtags
autocmd VimEnter * :GTags
autocmd VimEnter * :GLibTags
augroup END

"---SnipMate---"
"imap <C-J> <Plug>snipMateNextOrTrigger
"vmap <C-J> <Plug><CR>
"imap <leader><C-J> <Plug>snipMateShow
""imap <C-N> <Plug>snipMateShow
"imap <C-P> <Plug>snipMateBack
"vmap <C-J> <Plug>snipMateVisual

"---SnipMate---"
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-N>"
let g:UltiSnipsJumpForwardTrigger="<S-N>"

"--------------- Search -------------"
" turn on/off search hilights
nnoremap <F3> :set hlsearch!<CR>
" search and replace template"
vmap <F2> y:.,$s/<C-R>"//gc\|1,.-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nmap <F2> yiw:.,$s/<C-R>"//gc\|1,.-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
"find by pattern"
"unmap <C-F>
vmap <C-F> y/<C-R>"<cr>						
nmap <C-F> viwy/<C-R>"<cr>

"---Ag---"
" serach and replace by Ag"
command! -nargs=* Agreplace call Agreplace(<f-args>)
fun Agreplace(patt, str, ...)
"Agreplace patt str path/files"
    let path = a:0 >= 1 ? a:1 : "./"
    execute 'Ag! ' .a:patt . ' ' . path
    execute 'cdo %s/'. a:patt .'/'. a:str .'/gc | update'
endfun





"--------------- Split Managment -------------"
" creates new split below 
set splitbelow
" creates new split right
set splitright
" remam keys for split moving
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





"--------------- Mappings -------------"
" Make it easy to edit the Vimrc file.
" nmap <leader>ev :tabedit ~/.vimrc<cr>

"set selected text as comment block"
map <C-_> :s/^/# <cr>
" turn-off selected text as comment block"
map <leader><c-_> :s/# //<cr>

" Quotes setup"
" start in quotes"
nmap 2" 2i"<ESC>i
nmap 2' 2i'<ESC>i
imap 2" ""<Left>
imap 2' ''<Left>
nmap 2( i()<Left>
imap 2( ()<Left>
nmap 2[ i[]<Left>
imap 2[ []<Left>
nmap 2{ i{}<Left>
imap 2{ {}<Left>
nmap 2( i()<Left>
imap 2( ()<Left>
nmap 2< i<><Left>
imap 2< <><Left>
" surrond selection to quotes"
vmap " m>o<ESC>i"<ESC>`>la"<ESC>
vmap ' m>o<ESC>i'<ESC>`>la'<ESC>
vmap [ m>o<ESC>i[<ESC>`>la]<ESC>
vmap { m>o<ESC>i{<ESC>`>la}<ESC>
vmap ( m>o<ESC>i(<ESC>`>la)<ESC>
vmap { m>o<ESC>i<<ESC>`>la><ESC>
" quit"
nmap <leader>c :q<cr>
nmap !<leader>c :q!<cr>
"saves"
nmap <C-s> :w<cr>
" force write"
nmap <leader><C-s> :w!<cr>
" tab for aoutcompleate
"imap <tab> <C-N>
" move to last tab"
nmap gl :tablast<cr>
" Move cursor to the end of the line"
nmap <leader>0 g_
" exec current file
"nmap <leader><C-B> :!'%:p'<CR>
nmap <leader><C-B> :!$VIRTUAL_ENV/bin/python '%:p'<CR>

"-------------Auto-Commands-----------"
"Automatically source the Vimrc file on save.
augroup aoutosourcing
	autocmd! 
	autocmd BufWritePost .vimrc source %
augroup END
