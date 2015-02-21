" Nightly Color Scheme
" ===================
"
" Author:   Valeryi Savich <Relrin78@gmail.com>
" Version:  0.1
"
set background=dark


hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="nightly"


" Default Colors
hi Normal               guifg=#DADADA   guibg=#15191D
hi NonText              guifg=#444444   guibg=#15191D
hi Cursor                               guibg=#306396
hi lCursor                              guibg=#306396
hi Visual               guifg=#DBDBDB   guibg=#264059   gui=none

" Window Elements
hi CursorLine                           guibg=#242b32
hi CursorLineNr         guifg=#ffffff   guibg=#00252e
hi LineNr               guifg=#718085   guibg=#00252e
hi SignColumn                           guibg=#111111
hi VertSplit            guifg=#a0b0c0   guibg=#a0b0c0
hi Pmenu                guifg=#ffffff   guibg=#633D80

" Search
hi Search               guifg=#800000   guibg=#ffae00
hi IncSearch            guifg=#800000   guibg=#ffae00

" Specials
hi Todo                 guifg=#1AABC9   guibg=NONE      gui=italic,bold
hi Title                guifg=#ffffff                   gui=bold
hi Special              guifg=#fd8900

" Syntax Elements
hi String               guifg=#0086d2
hi Constant             guifg=#fd8900
hi Number               guifg=#A05FBA                   gui=bold
hi Statement            guifg=#D60257                   gui=bold
hi Function             guifg=#D60257                   gui=bold
hi PreProc              guifg=#82C100                   gui=bold
hi Comment              guifg=#465360                   gui=italic
hi Type                 guifg=#E5C300                   gui=bold
hi Error                guifg=#ffffff   guibg=#ab0000
hi Identifier           guifg=#FD8900                   gui=bold
hi Label                guifg=#D60257

" Python Highlighting
hi pythonStatement      guifg=#D60257
hi pythonCoding         guifg=#A2BB6B
hi pythonRun            guifg=#A2BB6B
hi pythonBuiltinObj     guifg=#84D701
hi pythonBuiltinFunc    guifg=#D5BA5B                   gui=bold
hi pythonException      guifg=#F4C118                   gui=bold
hi pythonExClass        guifg=#E5C300                   gui=bold
hi pythonSpaceError                     guibg=#270000
hi pythonDocTest        guifg=#3c8e68
hi pythonDocTest2       guifg=#3c8e68
hi pythonFunction       guifg=#82C100                   gui=bold
hi pythonClass          guifg=#82C100                   gui=bold
hi pythonString         guifg=#0086d2
hi pythonEscape         guifg=#fd8900
hi pythonStrFormat      guifg=#fd8900

" HTML Highlighting
hi htmlTag              guifg=#00bdec                   gui=bold
hi htmlEndTag           guifg=#00bdec                   gui=bold
hi htmlSpecialTagName   guifg=#66cd66
hi htmlTagName          guifg=#66cd66
hi htmlTagN             guifg=#66cd66
hi htmlEvent            guifg=#ffffff

" CSS Highlighting
hi cssIdentifier        guifg=#66cd66                   gui=bold
hi cssBraces            guifg=#00bdec                   gui=bold

" JavaScript Highlighting
hi javaScript                   guifg=#ffffff
hi javaScriptRegexpString       guifg=#aa6600
hi javaScriptDocComment         guifg=#aaaaaa
hi javaScriptCssStyles          guifg=#dd7700
hi javaScriptDomElemFuncs       guifg=#66cd66
hi javaScriptHtmlElemFuncs      guifg=#dd7700
hi javaScriptLabel              guifg=#00bdec           gui=italic
hi javaScriptPrototype          guifg=#00bdec
hi javaScriptConditional        guifg=#ff0007           gui=bold
hi javaScriptRepeat             guifg=#ff0007           gui=bold
hi javaScriptFunction           guifg=#ff0086           gui=bold

" Django Highlighting
hi djangoTagBlock        guifg=#ff0007   guibg=#200000   gui=bold
hi djangoVarBlock        guifg=#ff0007   guibg=#200000
hi djangoArgument        guifg=#0086d2   guibg=#200000
hi djangoStatement       guifg=#fb660a   guibg=#200000   gui=bold
hi djangoComment         guifg=#008800   guibg=#002300   gui=italic
hi djangoFilter          guifg=#ff0086   guibg=#200000   gui=italic

" Jinja Highlighting
hi jinjaTagBlock         guifg=#ff0007   guibg=#200000   gui=bold
hi jinjaVarBlock         guifg=#ff0007   guibg=#200000
hi jinjaString           guifg=#0086d2   guibg=#200000
hi jinjaNumber           guifg=#bf0945   guibg=#200000   gui=bold
hi jinjaStatement        guifg=#fb660a   guibg=#200000   gui=bold
hi jinjaComment          guifg=#008800   guibg=#002300   gui=italic
hi jinjaCommentDelim     guifg=#008800   guibg=#002300   gui=bold
hi jinjaFilter           guifg=#ff0086   guibg=#200000
hi jinjaFunction         guifg=#ff0086   guibg=#200000   gui=bold
hi jinjaRaw              guifg=#ffffff   guibg=#200000
hi jinjaRawDelim         guifg=#aaaaaa   guibg=#200000   gui=bold
hi jinjaOperator         guifg=#ffffff   guibg=#200000
hi jinjaVariable         guifg=#92cd35   guibg=#200000
hi jinjaAttribute        guifg=#dd7700   guibg=#200000
hi jinjaSpecial          guifg=#008ffd   guibg=#200000
