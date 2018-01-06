" Vim color file
" Created by Peter Chu http://peterchu.net
" This theme is based on the theme 'moonfly' by Dennis Bordin, which is based on 
" monokai, molokai, slate2, sunburst, twilight and xoria256 themes.

" More colours: http://en.wikipedia.org/wiki/X11_color_names
let s:black       = "#080808"
let s:white       = "#d0d0d0"
let s:light_gray  = "#9e9e9e"
let s:dim_gray    = "#373c40"
let s:medium_gray = "#303030"
let s:dark_gray   = "#1c1c1c"
let s:wheat       = "#e9d4ab"
let s:khaki       = "#dcd08c"
let s:orange      = "#de935f"
let s:coral       = "#f09479"
let s:light_green = "#85dc85"
let s:green       = "#0cc47a"
let s:green2      = "#68db1a"
let s:green3      = "#a6e22e"
let s:green4      = "#8defb5"
let s:green5      = "#a1dd63"
let s:green6      = "#aaffaa"
let s:green7      = "#20b2aa"
let s:green8      = "#32cd32"
let s:bright_green= "#40f030"
let s:emerald     = "#42cf89"
let s:blue        = "#80a0ff"
let s:light_blue  = "#89d2ef"
let s:turquoise   = "#7ee0ce"
let s:purple      = "#ae81ff"
let s:purple2     = "#ae81ff"
let s:purple3     = "#aaaaff"
let s:violet      = "#e2637f"
let s:magenta     = "#ee82ee"
let s:magenta2o   = "#ff45cd"
let s:magenta2    = "#ff45e6"
let s:pink        = "#ff69b4"
let s:crimson     = "#ed246c"
let s:red         = "#ff5454"
let s:light_red   = "#ffb5b5"
let s:light_red2  = "#f29b8a"
let s:yellow      = "#f5e430"
let s:yellow2     = "#ffd75f"

" For 256-color terminal colors. 
"
" .Xdefaults need to be setup with the following definitions; then launch 
" xterm via 'xterm -name xterm-moonfly':
"
" xterm-moonfly*color0: #373c40
" xterm-moonfly*color1: #ff5454
" xterm-moonfly*color2: #89bb25
" xterm-moonfly*color3: #dcd08c
" xterm-moonfly*color4: #80a0ff
" xterm-moonfly*color5: #ee82ee
" xterm-moonfly*color6: #7ee0ce
" xterm-moonfly*color7: #de935f
" xterm-moonfly*color8: #f09479
" xterm-moonfly*color9: #ed246c
" xterm-moonfly*color10: #42cf89
" xterm-moonfly*color11: #e9d4ab
" xterm-moonfly*color12: #89d2ef
" xterm-moonfly*color13: #ae81ff
" xterm-moonfly*color14: #85dc85
" xterm-moonfly*color15: #e2637f
"
" black       = 232
" white       = 252
" light_gray  = 247
" dim_gray    = 0
" medium_gray = 236
" dark_gray   = 234
" wheat       = 11
" khaki       = 3
" orange      = 7
" coral       = 8
" light_green = 14
" green       = 2
" emerald     = 10
" blue        = 4
" light_blue  = 12
" turquoise   = 6
" purple      = 13
" violet      = 15
" magenta     = 5
" crimson     = 9
" red         = 1


highlight clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="harmony"


" Background and text.
exec "highlight Normal ctermbg=232 guibg=" . s:black . "  ctermfg=252 guifg=" . s:white

" Color of mode text, -- INSERT --
exec "highlight ModeMsg ctermfg=11 guifg=" . s:wheat . " gui=none"

" Comments.
exec "highlight Comment ctermfg=247 guifg=" . s:light_gray

" Cursor line and column
exec "highlight CursorLine guifg=NONE guibg=#222222 gui=none"
exec "highlight CursorColumn guifg=NONE guibg=#222222 gui=none"

" Functions.
exec "highlight Function ctermfg=12 guifg=" . s:light_blue

" Strings.
exec "highlight String ctermfg=11 guifg=" . s:wheat

" Identifiers.
exec "highlight Identifier ctermfg=122 guifg=" . s:turquoise

" Color of titles, e.g in HTML files and Tagbar.
exec "highlight Title ctermfg=7 guifg=" . s:orange . " gui=none"

" const, static.
exec "highlight StorageClass ctermfg=8 guifg=" . s:green5

" void, intptr_t.
exec "highlight Type ctermfg=10 guifg=" . s:green . " gui=none"

" Numbers.
exec "highlight Constant ctermfg=13 guifg=" . s:light_red

" ifdef/endif.
exec "highlight PreProc ctermfg=15 guifg=" . s:blue

" Status and split lines.
exec "highlight StatusLine ctermbg=7 guibg=" . s:medium_gray . " ctermfg=236 guifg=" . s:orange . " gui=none"
exec "highlight StatusLineNC ctermbg=fg guibg=" . s:medium_gray . " ctermfg=236 guifg=fg gui=none"
exec "highlight VertSplit ctermbg=236 guibg=" . s:medium_gray . " ctermfg=236 guifg=" . s:medium_gray

" case in switch statement.
exec "highlight Label ctermfg=6 guifg=" . s:violet

" end-of-line '$', end-of-file '~'
exec "highlight NonText ctermfg=7 guifg=" . s:light_red . " gui=none"

" sizeof
exec "highlight Operator ctermfg=15 guifg=" . s:light_blue

" for, while.
exec "highlight Repeat ctermfg=7 guifg=" . s:violet

" Search.
exec "highlight Search ctermbg=7 guibg=" . s:orange . " ctermfg=bg guifg=bg"
exec "highlight IncSearch ctermbg=bg guibg=bg ctermfg=3 guifg=" . s:khaki

" '\n' sequences.
exec "highlight Special ctermfg=15 guifg=" . s:light_red

" if, else.
exec "highlight Statement ctermfg=5 guifg=" . s:violet . " gui=none"

" Visual selection.
exec "highlight Visual ctermbg=0 guibg=" . s:light_gray . " ctermfg=bg guifg=bg"
exec "highlight VisualNOS ctermbg=9 guibg=" . s:light_gray . " ctermfg=fg guifg=fg gui=none"

" Exceptions.
exec "highlight Exception ctermfg=14 guifg=" . s:red

" Errors, warnings and whitespace-eol.
exec "highlight Error ctermbg=bg guibg=bg ctermfg=1 guifg=" . s:red
exec "highlight ErrorMsg ctermbg=bg guibg=bg ctermfg=1 guifg=" . s:red
exec "highlight WarningMsg ctermbg=bg guibg=bg ctermfg=7 guifg=" . s:orange

" struct, union, enum, typedef.
exec "highlight Structure ctermfg=10 guifg=" . s:yellow2

" Auto-text-completion menu.
exec "highlight Pmenu ctermbg=236 guibg=" . s:medium_gray . " ctermfg=fg guifg=fg"
exec "highlight PmenuSel ctermbg=7 guibg=" . s:orange . " ctermfg=236 guifg=" . s:medium_gray

" Spelling errors.
exec "highlight SpellBad ctermbg=1 guibg=" . s:light_red2 . " ctermfg=236 guifg=" . s:medium_gray . " gui=none"
exec "highlight SpellCap ctermbg=4 guibg=" . s:blue . " ctermfg=236 guifg=" . s:medium_gray . " gui=none"
exec "highlight SpellRare ctermbg=15 guibg=" . s:violet . " ctermfg=236 guifg=" . s:medium_gray . " gui=none"
exec "highlight SpellLocal ctermbg=12 guibg=" . s:light_blue . " ctermfg=236 guifg=" . s:medium_gray . " gui=none"

" Misc.
exec "highlight Question ctermfg=11 guifg=" . s:wheat . " gui=none"
exec "highlight MoreMsg ctermbg=236 guibg=" . s:medium_gray . " ctermfg=11 guifg=" . s:wheat . " gui=none"
exec "highlight LineNr ctermbg=234 guibg=" . s:dark_gray . " ctermfg=247 guifg=" . s:light_gray
exec "highlight CursorLineNr ctermbg=234 guibg=" . s:dark_gray . " ctermfg=247 guifg=" . s:light_gray . " gui=none"
exec "highlight CursorLine ctermbg=241 ctermfg=252 cterm=none"
exec "highlight FoldColumn ctermbg=236 guibg=" . s:medium_gray . " guifg=fg"
exec "highlight Folded ctermbg=236 guibg=" . s:medium_gray . " ctermfg=fg guifg=fg"
exec "highlight SignColumn ctermbg=236 guibg=" . s:medium_gray . " guifg=fg"
exec "highlight Todo ctermbg=3 guibg=" . s:khaki . " ctermfg=bg guifg=bg"
exec "highlight SpecialKey ctermbg=bg guibg=bg ctermfg=12 guifg=" . s:light_blue
exec "highlight MatchParen ctermbg=31"

" Colums after line 80.
exec "highlight ColorColumn ctermbg=234 guibg=" . s:dark_gray

" For C/C++.
"
" goto, break, return, continue.
exec "highlight cStatement ctermfg=6 guifg=" . s:purple
" new, delete, this, using.
exec "highlight cppStatement ctermfg=9 guifg=" . s:crimson
" [static/const/dynamic]_cast.
exec "highlight cppCast ctermfg=10 guifg=" . s:green5
" public, private.
exec "highlight cppAccess ctermfg=14 guifg=" . s:magenta
" operator.
exec "highlight cppOperator ctermfg=2 guifg=" . s:light_blue
" inline, virtual, explicit, export, bool.
exec "highlight cppType ctermfg=3 guifg=" . s:green5
" class, typename, template, namespace.
exec "highlight cppStructure ctermfg=4 guifg=" . s:yellow2
" true or false.
exec "highlight cppBoolean ctermfg=13 guifg=" . s:light_red

" For shell scripts.
exec "highlight shStatement ctermfg=fg guifg=fg"
exec "highlight shCommandSub ctermfg=fg guifg=fg"
exec "highlight shSet ctermfg=14 guifg=" . s:light_green
exec "highlight shShellVariables ctermfg=8 guifg=" . s:coral
exec "highlight shVariable ctermfg=6 guifg=" . s:turquoise
exec "highlight shAlias ctermfg=6 guifg=" . s:turquoise
exec "highlight shSetList ctermfg=6 guifg=" . s:turquoise

" For HTML .
exec "highlight htmlBold ctermfg=fg guifg=fg"
exec "highlight htmlLink ctermfg=7 guifg=" . s:orange

" For Python.
exec "highlight pythonRepeat ctermfg=7 guifg=" . s:orange
exec "highlight pythonStatement ctermfg=10 guifg=" s:emerald

" For Ace.
exec "highlight aceConstant ctermfg=6 guifg=" . s:turquoise
exec "highlight aceStatement ctermfg=8 guifg=" . s:violet
exec "highlight aceStructure ctermfg=4 guifg=" . s:yellow

" For DDM files.
exec "highlight ddmType ctermfg=4 guifg=" . s:blue

" For Java.
exec "highlight javaCommentTitle ctermfg=247 guifg=" . s:light_gray
exec "highlight javaClassDecl ctermfg=10 guifg=" . s:emerald
exec "highlight javaScopeDecl ctermfg=4 guifg=" . s:blue
exec "highlight javaBraces ctermfg=252 guifg=" . s:white
exec "highlight javaOperator ctermfg=9 guifg=" . s:crimson
exec "highlight javaStatement ctermfg=6 guifg=" . s:turquoise
exec "highlight javaMethodDecl ctermfg=3 guifg=" . s:khaki
exec "highlight javaConstant ctermfg=12 guifg=" . s:light_blue
exec "highlight javaDebug ctermfg=12 guifg=" . s:light_blue
let java_highlight_java_lang_ids = 1
let java_highlight_debug = 1

" For Groovy.
exec "highlight groovyClassDecl ctermfg=10 guifg=" . s:emerald
exec "highlight groovyScopeDecl ctermfg=4 guifg=" . s:blue
exec "highlight groovyStatement ctermfg=6 guifg=" . s:turquoise
let groovy_allow_cpp_keywords = 1

" For vimdiff.
exec "highlight DiffAdd ctermbg=2 guibg=" . s:green . " ctermfg=bg guifg=bg"
exec "highlight DiffChange ctermbg=247 guibg=" . s:light_gray . " ctermfg=bg guifg=bg"
exec "highlight DiffDelete ctermbg=236 guibg=" . s:medium_gray . " ctermfg=bg guifg=fg gui=none"
exec "highlight DiffText ctermbg=4 guibg=" . s:blue . " ctermfg=bg guifg=bg gui=none"

" For vim files.
exec "highlight vimCommand ctermfg=7 guifg=" . s:orange
exec "highlight vimOption ctermfg=14 guifg=" . s:light_green

" For XML files.
exec "highlight xmlEndTag ctermfg=6 guifg=" . s:turquoise

" For Tagbar.
exec "highlight TagbarFoldIcon ctermfg=247 guifg=" . s:light_gray
exec "highlight TagbarVisibilityPublic ctermfg=14 guifg=" . s:light_green
exec "highlight TagbarVisibilityProtected ctermfg=14 guifg=" . s:light_green
exec "highlight TagbarVisibilityPrivate ctermfg=14 guifg=" . s:light_green
exec "highlight TagbarKind ctermfg=10 guifg=" . s:emerald

" For misc plugins.
exec "highlight Directory ctermfg=12 guifg=" . s:light_blue
exec "highlight NERDTreeFlag ctermfg=247 guifg=" . s:light_gray
exec "highlight NERDTreeLink ctermfg=4 guifg=" . s:blue
exec "highlight NERDTreeCWD ctermfg=14 guifg=" . s:light_green
exec "highlight CtrlPMatch ctermfg=6 guifg=" . s:turquoise
