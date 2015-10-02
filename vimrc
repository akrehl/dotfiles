" vim: foldmethod=marker
execute pathogen#infect()
syntax on
filetype plugin indent on

"************************************************************
" Preferences {{{1
"************************************************************
"
" ==================== Appearance ==================== {{{2
set number
" set relativenumber
set cursorline
set hidden
let mapleader=","
set backspace=indent,eol,start
set listchars=tab:▸\ ,eol:¬
set list

" ==================== Behaviour ==================== {{{2
" for shellscripts and Dockerfiles use tabs
if has("autocmd")
  autocmd FileType dockerfile set noexpandtab
  autocmd FileType fstab,systemd set noexpandtab
  autocmd FileType gitconfig,sh,toml,vim set noexpandtab
  autocmd FileType css,sass set noautoindent
endif

"************************************************************
" Mappings {{{1
"************************************************************
"
nnoremap <Space> za
nnoremap ü <C-]>
nnoremap Ü <C-O>
" Auto-closing braces
inoremap {<CR>  {<CR>}<Esc>O
inoremap (<CR>  (<CR>)<Esc>O>
" Map Omni Completion
inoremap <C-Space> <C-x><C-o>

"************************************************************
" Colorscheme {{{1
"************************************************************
"
colorscheme solarized
set background=dark

"************************************************************
" Plugin configuration {{{1
"************************************************************
"
" ==================== vim-airline ==================== {{{2
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif
set laststatus=2
set t_Co=256
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline#extensions#branch#enabled = 1

" ==================== nerdtree ==================== {{{2
let g:NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" ==================== tagbar ==================== {{{2
nmap <leader>. :TagbarToggle<CR>

" ==================== vim-go ==================== {{{2
"syntax enable  
"filetype plugin on  
"set number

let g:go_disable_autoinstall = 0
let g:go_fmt_command = "goimports"
" Enable syntax highting on everything
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" go tagbar
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" go mappings
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>e <Plug>(go-rename)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" ==================== vim-multiple-cursors ==================== {{{2
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-f>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-q>'

" ==================== ultisnips ==================== {{{2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" getting ultisnips and YCM working side by side
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_extra_conf_vim_data = ['v:version']
hi SpecialKey ctermbg=none

" ==================== ctrlp ==================== {{{2
let g:ctrlp_map = '<leader>f'

" ==================== emmet-vim ==================== {{{2
"let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" ==================== ack.vim ==================== {{{2
map <leader>a :tab split<CR>:Ack ""<Left>
map <leader>A :tab split<CR>:Ack <C-r><C-w><CR>
