
so ~/.vim/plugins

"The latest Vim settings/options
set nocompatible 
let mapleader = ","


"--------------- Visuals -------------"
"colorscheme darkblue
colorscheme gruvbox
set background=dark
""autocmd vimenter * ++nested colorscheme gruvbox 

""set guifont=Fira_Code:h17
"" Turn off pannel slide"
" set guioptions=-l
" set guioptions=-L
" set guioptions=-r
" set guioptions=-R
  

"------------- Options ---------------"

set number
set mouse=n
set tabstop=4
set expandtab
set shiftwidth=4

"-statusline"
set laststatus=2
set statusline=
set statusline+=%-5m               "Modified flag"
set statusline+=%F                 "Full path"
set statusline+=%=                 "Left/Right separator"
set statusline+=%l/%-5L:           "Lines"
set statusline+=%-5c:              "Column"
set statusline+=%y                 "Type file"


" -------------- Plugins -------------- "

" --- Neomake"
call neomake#configure#automake({
\ 'TextChanged': {},
\ 'InsertLeave': {},
\ 'BufWritePost': {'delay': 0}, 
\ 'BufWinEnter': {'delay': 0}, 
\ }, 100)

let g:neomake_python_flake8_maker = {
\ 'exe': 'flake8',
\ 'args': ['--max-complexity', '3'],
\ }

let g:neomake_python_enabled_makers = ['flake8', 'mypy']
let g:neomake_error_sign = {
\ 'text': 'E>',
\ 'texthl': 'NeomakeErrorSign',
\ }
let g:neomake_warning_sign = {
\   'text': 'W>',
\   'texthl': 'NeomakeWarningSign',
\ }

" --- UltiSnips --- "
let g:UltiSnipsEditSplit="tabdo" " Open an snipfile in saparate tab.
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/bundle/vim-snippets/UltiSnips"] " Path to snippets.
let g:UltiSnipsExpandTrigger="<Leader>j" " The shortcut for expanding snippets.

" --- NERDTree --- "
nmap <C-B><C-K> :NERDTreeToggle<cr>
let NERDTreeHijackNetrw=1 " replace the standart edit mode (e .).
let NERDTreeIgnore=["__pycache__$[[dir]]"]

"---Ag---"
"" serach and replace by Ag"
command! -nargs=* Agreplace call Agreplace(<f-args>) 
fun Agreplace(patt, str, ...)
"Agreplace patt str path/files"
    let path = a:0 >= 1 ? a:1 : "./"
    execute 'Ag! ' .a:patt . ' ' . path
    execute 'cdo %s/'. a:patt .'/'. a:str .'/gc | update'
endfun

"--------------- Split Managment -------------"
set splitbelow  " creates a new split below. 
" set splitright " creates new split right

" -remam keys for split moving
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--------------- Search -------------"
" turn on/off search hilights
nnoremap <F3> :set hlsearch!<CR>
" --- search and replace template"
vmap <F2> y:.,$s/<C-R>"//gc\|1,.-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nmap <F2> yiw:.,$s/<C-R>"//gc\|1,.-&&<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" --- find by pattern"
vmap <C-F> y/<C-R>"<cr>						
nmap <C-F> viwy/<C-R>"<cr>


"--------------- Mappings -------------"
"Make it easy to edit the Vimrc file.
nmap <leader>ev :tabedit $MYVIMRC<cr> 

"set selected text as comment block"
map <C-_> :s/^/# <cr>
" turn-off selected text as comment block"
map <leader><c-_> :s/# //<cr>

" surrond selection to quotes"
vnoremap " m>o<ESC>i"<ESC>`>la"<ESC>
vnoremap ' m>o<ESC>i'<ESC>`>la'<ESC>
vnoremap ( m>o<ESC>i(<ESC>`>la)<ESC>
vnoremap [ m>o<ESC>i[<ESC>`>la]<ESC>
vnoremap { m>o<ESC>i{<ESC>`>la}<ESC>

" --- Doublecharacters---"
imap " <Esc>:call DoubleChar('"')<CR>
imap ' <Esc>:call DoubleChar("'")<CR>
imap ( <Esc>:call DoubleChar("(", ")")<CR>
imap ) <Esc>:call DoubleChar("(", ")")<CR>
imap [ <Esc>:call DoubleChar("[", "]")<CR>
imap ] <Esc>:call DoubleChar("[", "]")<CR>
imap { <Esc>:call DoubleChar("{", "}")<CR>
imap } <Esc>:call DoubleChar("{", "}")<CR>
imap < <Esc>:call DoubleChar("<", ">")<CR>
imap > <Esc>:call DoubleChar("<", ">")<CR>

   
fun DoubleChar(char, ...)
	if a:0 > 0
		let ch1 = a:char
		let ch2 = a:1
	else
		let ch1 = a:char
		let ch2 = a:char
	endif

	let char = strpart(getline("."), col("."), 1)
    let next_char = strpart(getline("."), col(".") + 1, 1)
	if char == ch2
        if char2nr(next_char) == 0
            call InsertTo(getline("."), ' ' , col(".") + 1)   
        else
            call InsertTo(getline("."), "", col(".") + 1)   
        endif 
	else
		call InsertTo(getline("."), ch1 . ch2, col("."))   
	endif
endfunction


fun InsertTo(line, insert_line, pos)
	let p1 = strpart(a:line, 0, a:pos)
	let p2 = strpart(a:line, a:pos)
	call setline(".", p1 . a:insert_line . p2)
	exe "norm! ll"
	exe "startinsert"
endfunction
" ---"

" quit"
nmap <leader>c :q<cr> 
nmap !<leader>c :q!<cr> 

"save"
nmap <C-s> :w<cr>

"force write"
nmap <leader><C-s> :w!<cr>

" move to last tab"
nmap gl :tablast<cr> 
" move to prev active tab"
au TabLeave * let g:lasttab = tabpagenr()  
nnoremap g<Tab> :exe "tabn".g:lasttab<cr>  

" Move cursor to the end of the line"
nmap <leader>0 g_

" exec current file
nmap <leader><C-B>  :!python3 '%:p'<CR>
""nmap <leader><C-B> :!$VIRTUAL_ENV/bin/python '%:p'<CR> 

""
" -Location list navigation"
function LocationPrevious()
    try
        lprev
    catch /^Vim\%((\a\+)\)\=:E553/
        llast
    endtry
endfunction    
function LocationNext()
    try
        lnext
    catch /^Vim\%((\a\+)\)\=:E553/
        lfirst
    endtry
endfunction    

nmap <C-n> :call LocationNext()<CR>
nmap <S-n> :call LocationPrevious()<CR>
"nmap <C-n> :ll<CR> 



"-------------Auto-Commands-----------"
"Automatically source the Vimrc file on save.
 ""augroup aoutosourcing
 ""	autocmd! 
 ""	autocmd BufWritePost vimrc source %
 ""augroup END

