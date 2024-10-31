" Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='felipec'

hi Normal guifg=#dedde4 ctermfg=254 guibg=#16151a ctermbg=234 gui=NONE cterm=NONE
hi Comment guifg=#807f86 ctermfg=245 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Todo guifg=#bc938c ctermfg=138 guibg=#2e2d33 ctermbg=236 gui=bold,italic cterm=bold,italic
hi Error guifg=#bc938c ctermfg=138 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi Constant guifg=#bc938c ctermfg=138 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#83a3bb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#aa9e7b ctermfg=144 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#7ca99f ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#b194ad ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#a398ba ctermfg=139 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Title guifg=#929ebe ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#bc938c ctermfg=138 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Function guifg=#9aa381 ctermfg=108 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi String guifg=#89a88e ctermfg=108 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Special guifg=#b69880 ctermfg=138 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Underlined gui=underline cterm=underline
hi Cursor guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi Search guifg=#ba929d ctermfg=139 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi Visual guifg=#a398ba ctermfg=139 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi MatchParen guifg=#bc938c ctermfg=138 guibg=#22110e ctermbg=234 gui=bold cterm=bold
hi NonText guifg=#4d3700 ctermfg=58 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi SpecialKey guifg=#b69880 ctermfg=138 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#bc938c ctermfg=138 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi WarningMsg guifg=#b69880 ctermfg=138 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi ModeMsg guifg=#aa9e7b ctermfg=144 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi MoreMsg guifg=#89a88e ctermfg=108 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi Question guifg=#7aa7b0 ctermfg=109 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi Directory guifg=#929ebe ctermfg=109 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi DiffAdd guifg=NONE ctermfg=NONE guibg=#0c1a0f ctermbg=233 gui=NONE cterm=NONE
hi DiffDelete guifg=#22110e ctermfg=234 guibg=#22110e ctermbg=234 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#111524 ctermbg=234 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=#031a1e ctermbg=234 gui=NONE cterm=NONE
hi Folded guifg=#929ebe ctermfg=109 guibg=#2e2d33 ctermbg=236 gui=italic cterm=italic
hi FoldColumn guifg=#929ebe ctermfg=109 guibg=#16151a ctermbg=234 gui=NONE cterm=NONE
hi Pmenu guifg=#dedde4 ctermfg=254 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi PmenuSel guifg=#929ebe ctermfg=109 guibg=#2e2d33 ctermbg=236 gui=bold,reverse cterm=bold,reverse
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#aa9e7b ctermbg=144 gui=NONE cterm=NONE
hi WildMenu guifg=#929ebe ctermfg=109 guibg=#2e2d33 ctermbg=236 gui=bold,reverse cterm=bold,reverse
hi LineNr guifg=#b69880 ctermfg=138 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi CursorLineNr guifg=#aa9e7b ctermfg=144 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi SpellBad guifg=#bc938c ctermfg=138 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpellCap guifg=#83a3bb ctermfg=109 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpellRare guifg=#b194ad ctermfg=139 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpellLocal guifg=#7aa7b0 ctermfg=109 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi diffAdded guifg=#89a88e ctermfg=108 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffRemoved guifg=#bc938c ctermfg=138 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffFile guifg=#929ebe ctermfg=109 guibg=NONE ctermbg=NONE gui=bold,reverse cterm=bold,reverse
hi diffNewFile guifg=#89a88e ctermfg=108 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi diffOldFile guifg=#bc938c ctermfg=138 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi rubyArrayDelimiter guifg=#83a3bb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi rubyCurlyBlockDelimiter guifg=#83a3bb ctermfg=109 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SignColumn guibg=#2e2d33 ctermbg=236
hi GitGutterAdd guifg=#89a88e ctermfg=108 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi GitGutterDelete guifg=#bc938c ctermfg=138 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi GitGutterChange guifg=#929ebe ctermfg=109 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#636269 ctermfg=242 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi TabLineSel guifg=#929ebe ctermfg=109 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi StatusLine guifg=#9e9da4 ctermfg=248 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi StatusLineNC guifg=#636269 ctermfg=242 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi StatusLineTerm guifg=#89a88e ctermfg=108 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#636269 ctermfg=242 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi VertSplit guifg=#dedde4 ctermfg=254 guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi QuickFixLine guifg=NONE ctermfg=NONE guibg=#031a1e ctermbg=234 gui=NONE cterm=NONE
hi ToolbarLine guibg=#2e2d33 ctermbg=236 gui=NONE cterm=NONE
hi ToolbarButton guifg=#807f86 ctermfg=245 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi debugPc guifg=NONE ctermfg=NONE guibg=#031a1e ctermbg=234 gui=NONE cterm=NONE
hi debugBreakpoint guifg=#bc938c ctermfg=138 guibg=NONE ctermbg=NONE gui=reverse cterm=reverse

let g:terminal_ansi_colors = [ '#16151a', '#bc938c', '#89a88e', '#aa9e7b', '#929ebe', '#b194ad', '#7aa7b0', '#9e9da4', '#636269', '#bc938c', '#89a88e', '#aa9e7b', '#929ebe', '#b194ad', '#7aa7b0', '#dedde4' ]
