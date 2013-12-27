" gvim specific settings.
"
set columns=84
set guifontset=
set guioptions-=T
set visualbell t_vb=


" Set the vertical size and a font.
"
set lines=64
if has("gui_gtk2")
    set guifont=Inconsolata\ 10.5
elseif has("win32")
    set guifont=Consolas:h11
endif


" gvim specific functions.
"
fun DoubleSizeAndVsplit()
    if &columns != 168
        set columns=168
        set guioptions+=l
        vsplit
        winpos 20 20
    else
        wincmd w
        close
        set columns=84
        set guioptions-=l
        winpos 20 20
    endif
endfun


" gvim specific keyboard mappings.
"
map <C-a> :call DoubleSizeAndVsplit()<CR>
map <C-q> :close<CR>
map <C-s> :split<CR>


" Hook in an extra menu for emake compilation.
"
if $OS == "SunOS"
    amenu Emake.forte :set makeprg=emake.sh\ forte<CR>:make<CR>
    amenu Emake.forte-O :set makeprg=emake.sh\ forte-O<CR>:make<CR>
elseif $OS == "Linux"
    amenu Emake.gcc :set makeprg=emake.sh\ gcc-debug<CR>:make<CR>
    amenu Emake.gcc-O :set makeprg=emake.sh\ gcc-O<CR>:make<CR>
endif

colors mayansmoke
