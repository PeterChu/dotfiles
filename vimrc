" Pathogen - Plugin Manager
call pathogen#infect()

" We want syntax highlighting on.
"
syntax on


" General vim settings.
"
set autoindent
set autowrite
set background=dark
set backspace=indent,eol,start
set complete=.,w,b
set expandtab
set formatoptions=cq
set history=50
set ignorecase
set incsearch
set laststatus=2
set mousehide
set nobackup
set nocompatible
set nohls
set nowrapscan
set number
set path=.,~/ttsrc/SUPPORT/src,~/ttsrc/API/src,~/ttsrc/Z3950/auto,~/ttsrc/ACE/**,~/ttsrc/SGML/src,~/ttsrc/CLI/**,~/ttsrc/CS/**
set ruler
set sh=/bin/bash
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smartcase
set smarttab
set splitbelow
if $OS == "SunOS"
    set term=xterm-color
endif
set textwidth=78
set viminfo=
set visualbell t_vb=
set wrap

" Certain options are only available in vim.
"
if v:progname != "vi"
    set foldnestmax=4
    set foldtext=""
    set mouse=a
    set nofoldenable
endif

"Set colorscheme as mayansmoke
"
colorscheme mayansmoke

" Customize the highlighting.
"
highlight aceStorageClass ctermfg=Magenta guifg=LightSalmon
highlight Comment ctermfg=Red guifg=#bebebe
highlight Constant ctermfg=White guifg=Wheat
highlight cppAccess ctermfg=Cyan guifg=LightBlue
highlight cppBoolean ctermfg=Green guifg=PaleGreen
highlight cppCast ctermfg=Cyan guifg=Turquoise
highlight cppExceptions ctermfg=Cyan gui=none guifg=Turquoise
highlight cppFunction ctermfg=LightBlue guifg=SkyBlue
highlight cppMethod ctermfg=LightBlue guifg=SkyBlue
highlight cppOperator ctermfg=Cyan guifg=PaleGreen
highlight cppStatement ctermfg=Cyan guifg=SkyBlue
highlight cppStructure ctermfg=LightBlue guifg=#80a0ff
highlight cppType ctermfg=LightBlue guifg=Turquoise
highlight cStatement ctermfg=Magenta guifg=Turquoise
highlight cStorageClass ctermfg=Magenta gui=none guifg=#ffc864
highlight cStructure ctermfg=LightBlue guifg=SkyBlue
highlight Exception ctermfg=LightBlue gui=none guifg=LightBlue
highlight Error ctermbg=Red guibg=#b21818
highlight ErrorMsg ctermbg=Red guibg=#b21818
highlight FoldColumn ctermfg=Cyan guibg=Black guifg=Cyan
highlight Folded ctermfg=Cyan guibg=Black guifg=Tan
highlight Function ctermfg=LightBlue guifg=SkyBlue
highlight htmlBold ctermfg=Magenta guifg=Violet
highlight htmlLink ctermfg=LightBlue guifg=#80a0ff
highlight Identifier ctermfg=LightBlue guifg=SkyBlue
highlight IncSearch ctermbg=LightBlue ctermfg=Magenta guibg=Yellow guifg=Purple
highlight javaCommentTitle ctermfg=Red guifg=Grey
highlight Label ctermfg=DarkGreen guifg=Turquoise
highlight LineNr ctermfg=LightBlue
highlight ModeMsg ctermfg=White gui=none guifg=FloralWhite
highlight NonText ctermfg=LightBlue guifg=SteelBlue
highlight Normal ctermbg=Black ctermfg=Gray guibg=Black guifg=FloralWhite
highlight Operator ctermfg=White guifg=Wheat
highlight PreProc ctermfg=Brown guifg=Coral
highlight pythonRepeat ctermfg=Magenta guifg=Violet
highlight pythonStatement ctermfg=LightGreen guifg=PaleGreen
highlight Question ctermfg=LightGreen gui=none guifg=#54ff54
highlight Repeat ctermfg=Yellow guifg=Violet
highlight Search ctermbg=Brown ctermfg=DarkBlue guibg=Orange guifg=Navy
highlight shConditional ctermfg=Yellow guifg=Goldenrod
highlight shStatement ctermfg=LightBlue guifg=PaleGreen
highlight ttMacro ctermfg=Magenta guifg=Violet
highlight ttMember ctermfg=Gray guifg=Tan
highlight ttParameter ctermfg=Gray guifg=MediumAquamarine
highlight ttType ctermfg=DarkGreen guifg=LightSalmon
highlight ttType2 ctermfg=LightGreen guifg=PaleGreen
highlight ttType3 ctermfg=Yellow guifg=LightGoldenrod
highlight Special ctermfg=Magenta guifg=LightMagenta
highlight Statement ctermfg=Cyan gui=none guifg=Goldenrod
highlight StatusLine ctermbg=Gray ctermfg=DarkBlue gui=none guibg=#2E3D73 guifg=LightGray
highlight StatusLineNC ctermbg=DarkBlue ctermfg=Gray gui=none guibg=Gray20 guifg=LightGray
highlight Type ctermfg=Green gui=none guifg=PaleGreen
highlight VertSplit ctermbg=DarkBlue ctermfg=Gray gui=none guibg=Gray20 guifg=LightGray
" Vim 7.0 and greater appears to use a different visual highlight selection
" mechanism compared to prior version of Vim.
if version < 700
    highlight Visual ctermfg=LightBlue guifg=DarkSlateBlue
    highlight VisualNOS gui=none guibg=Black
else
    highlight Visual ctermbg=LightBlue guibg=DarkSlateBlue
    highlight VisualNOS gui=none guibg=Gray40
endif


" Functions.
"
fun BlockFolds()
    if &foldenable
        set foldcolumn=0
        set nofoldenable
    else
        set foldenable
        set foldcolumn=4
        set foldmethod=indent
    endif
endfunc

fun FileOpen(p_extension)
    let w:basefile = substitute(bufname("%"), "\\.[a-zA-Z]\\+$", "", "")
    let w:newfile = w:basefile . a:p_extension
    if bufexists(w:newfile)
        execute "buffer" w:newfile
    elseif filereadable(w:newfile)
        execute "edit" w:newfile
    else
        echo w:newfile ": no such file."
    endif
endfun

fun HighlightEOL()
    if exists("g:highlightEOL")
        highlight WhitespaceEOL none
        match none
        unlet g:highlightEOL
    else
        highlight WhitespaceEOL ctermbg=Red guibg=Red
        match WhitespaceEOL /\s\+$/
        let g:highlightEOL = 1
    endif
endfun


" General keyboard mappings.
"
map <A-n> :bn<CR>
map <A-p> :bp<CR>
map <A-d> :bd<CR>
map <C-n> :n<CR>
map <C-p> :N<CR>
map <F2> :w<CR>
map <F3> :%retab<CR> :%s/\s\+$//<CR>
map <F4> @a
map <F5> :call FileOpen(".hh")<CR>
map <F6> :call FileOpen(".icc")<CR>
map <F7> :call FileOpen(".cc")<CR>
map <F8> :call FileOpen(".tcc")<CR>
map <F9> :call BlockFolds()<CR>
map <F10> :NERDTreeToggle<CR>
map <S-F10> :TagbarToggle<CR>
map <F11> :set hls!<CR>
map <F12> :set list!<CR> :call HighlightEOL()<CR>
" Compilation related mappings.
map <A-F5> :make<CR>
map <A-F6> :cn<CR>
map <A-F7> :cp<CR>
map <A-F8> :cl<CR>
map <C-F> :CtrlP
map <Home> ^
imap <Home> <Esc>^i
" Switch between windows
nnoremap <Tab> <C-W>W
" Close the current window
nnoremap <C-w> :q<CR>
" Turn syntastic on/off
nnoremap <C-F5> :SyntasticToggleMode<CR>

" Set emake compilation makeprg.
"
set makeprg=emake.sh\ gcc-debug


" Custom settings per language.
"
autocmd FileType ace :set smartindent cinwords=begin,catch,class,elif,else,finally,for,foreach,if,struct,try,while
autocmd FileType ace :inoremap # X#
autocmd FileType c,cpp :set cindent formatoptions=cq
autocmd FileType python :set smartindent cinwords=class,def,elif,else,except,finally,for,if,try,while
autocmd FileType python :inoremap # X#
autocmd FileType sh :set textwidth=999
autocmd FileType vim :set textwidth=999


" Custom file type to syntax mappings.
"
autocmd BufEnter *.{icc,tcc} set filetype=cpp
autocmd BufEnter Tmakefile,Trules,*/TCONFIG/*{api,clang,gcc,version,win}* set filetype=tmake


" YouCompleteMe Options
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" Ctrl-P option
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'

autocmd FileType msg :set nosi noai noexpandtab tabstop=8 nosmarttab
autocmd BufEnter,BufNewFile,BufReadPost,BufRead *.msg set filetype=msg
