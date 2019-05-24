" Name:       wintermute.vim
" Version:    0.1.0
" Maintainer: github.com/jgplane
" License:    The MIT License (MIT)
"
" A minimal colorscheme for Vim designed for terminal. 
"
" Based on the paramount colorscheme
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='wintermute'

let s:black           = { "gui": "#000000", "cterm": "232" }
let s:light_gray      = { "gui": "#767676", "cterm": "250" }
let s:medium_gray     = { "gui": "#767676", "cterm": "245" }
let s:darker_gray     = { "gui": "#767676", "cterm": "240" }
let s:white           = { "gui": "#FFFFFF", "cterm": "231" }
let s:subtle_black    = { "gui": "#1C1C1C", "cterm": "234" }
let s:light_black     = { "gui": "#262626", "cterm": "235" }
let s:lighter_black   = { "gui": "#4E4E4E", "cterm": "239" }
let s:lightest_gray   = { "gui": "#EEEEEE", "cterm": "254" }
let s:dark_red        = { "gui": "#C30771", "cterm": "1"   }
let s:light_red       = { "gui": "#E32791", "cterm": "1"   }
let s:dark_blue       = { "gui": "#008EC4", "cterm": "75"  }
let s:blue            = { "gui": "#5fd7ff", "cterm": "117" }
let s:light_blue      = { "gui": "#5fffff", "cterm": "159" }
let s:dark_green      = { "gui": "#10A778", "cterm": "2"   }
let s:light_green     = { "gui": "#5FD7A7", "cterm": "10"  }

let s:background = &background 

let s:bg              = s:light_black
let s:bg_alt          = s:subtle_black 
let s:bg_subtle       = s:lighter_black
let s:norm            = s:white
let s:norm_subtle     = s:medium_gray
let s:norm_dark       = s:darker_gray
let s:primary         = s:blue
let s:accent          = s:light_gray
let s:green           = s:blue
let s:red             = s:light_red
let s:visual          = s:blue

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:white, "fg": s:black })

call s:h("Comment",       {"fg": s:norm_dark, "gui": "italic"})
call s:h("Constant",      {"fg": s:primary})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

"call s:h("Identifier",    {"fg": s:dark_blue})
hi! link Identifier       Normal
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:norm_subtle})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm, "cterm": "bold", "gui": "bold"})

call s:h("PreProc",     {"fg": s:primary})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle, "gui": "italic"})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:white, "bg": s:red, "cterm": "bold"})
call s:h("Todo",          {"fg": s:primary, "gui": "underline", "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:light_red})
call s:h("NonText",       {"fg": s:norm_subtle})
call s:h("Directory",     {"fg": s:primary})
call s:h("ErrorMsg",      {"fg": s:red})
call s:h("IncSearch",     {"bg": s:primary, "fg": s:light_black})
call s:h("Search",        {"bg": s:primary, "fg": s:light_black})
call s:h("MoreMsg",       {"fg": s:norm_subtle, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle, "bg": s:bg_alt})
call s:h("CursorLineNr",  {"fg": s:primary, "bg": s:bg_alt})
call s:h("Question",      {"fg": s:norm_subtle})
call s:h("StatusLine",    {"bg": s:bg_alt})
call s:h("StatusLineNC",  {"bg": s:bg_alt, "fg": s:norm_subtle})
call s:h("VertSplit",     {"bg": s:bg_alt, "fg": s:bg_subtle})
call s:h("Title",         {"fg": s:primary})
call s:h("Visual",        {"fg": s:black, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:norm_subtle})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:norm_subtle})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:green})
call s:h("DiffDelete",    {"fg": s:red})
call s:h("DiffChange",    {"fg": s:primary})
call s:h("DiffText",      {"fg": s:dark_blue})
call s:h("SignColumn",    {"fg": s:light_green})

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuSel",      {"fg": s:bg_subtle, "bg": s:primary})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_alt})
call s:h("TabLineSel",    {"fg": s:primary, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_alt})
call s:h("CursorColumn",  {"bg": s:bg_alt})
call s:h("CursorLine",    {"bg": s:bg_alt})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:norm_subtle})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" RUBY Specific

call s:h("rubyClass",    {"fg": s:norm_subtle})
call s:h("rubyDefine",   {"fg": s:norm_subtle})
call s:h("rubyConditional",   {"fg": s:norm_subtle})
call s:h("rubyInstanceVariable", {"fg": s:accent})

