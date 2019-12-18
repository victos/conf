
function! InitAirlineConfig() abort
" ============================================================================ "
" ===                              Airline                                 === "
" ============================================================================ "
" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" Enable extensions
" let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
" let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
" let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z', 'warning', 'error']]

" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Configure error/warning section to use coc.nvim
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

let g:airline#extensions#tabline#buffer_nr_show = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
"  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
"  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
"  let g:airline_symbols.linenr = '☰'
"  let g:airline_symbols.linenr = '␊'
"  let g:airline_symbols.linenr = '␤'
"  let g:airline_symbols.linenr = '¶'
"  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
"  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
"  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.dirty='⚡'

  " old vim-powerline symbols
"  let g:airline_left_sep = '⮀'
"  let g:airline_left_alt_sep = '⮁'
"  let g:airline_right_sep = '⮂'
"  let g:airline_right_alt_sep = '⮃'
"  let g:airline_symbols.branch = '⭠'
"  let g:airline_symbols.readonly = '⭤'
"  let g:airline_symbols.linenr = '⭡'

" unicode symbols
" let g:airline_left_sep = '❮'
" let g:airline_right_sep = '❯'

" Don't show git changes to current file in airline
" let g:airline#extensions#hunks#enabled=0

catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry
endfunction

call InitAirlineConfig()
