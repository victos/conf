" check whether minpac is installed and install it if necessary
let home = $HOME
let nvim_config_path = home . '/.config/nvim/'
let plugpath = nvim_config_path . 'pack/minpac/opt/minpac/plugin/minpac.vim'
if !filereadable(plugpath)
    if executable('git')
        let plugurl = 'https://github.com/k-takata/minpac.git'
        call system('git clone ' . plugurl . ' ' . nvim_config_path . '/pack/minpac/opt/minpac')
        if v:shell_error
	    echom plugpath
            echom "Error when clone minpac. Please install it manually.\n"
            exit
        endif
    else
        echom "minpac not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

packadd minpac
call minpac#init()

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
call minpac#add('ntpeters/vim-better-whitespace')

" auto-close plugin
call minpac#add('rstacruz/vim-closer')

" Improved motion in Vim
call minpac#add('easymotion/vim-easymotion')

" Intellisense Engine
call minpac#add('neoclide/coc.nvim', {'do': {-> system('yarn install --frozen-lockfile')}, 'branch': 'release'})

" === Git Plugins === "
" Enable git changes to be shown in sign column
call minpac#add('mhinz/vim-signify')
call minpac#add('tpope/vim-fugitive')

" === Javascript Plugins === "
" Typescript syntax highlighting
call minpac#add('HerringtonDarkholme/yats.vim')

" === Syntax Highlighting === "

" Syntax highlighting for javascript libraries
call minpac#add('othree/javascript-libraries-syntax.vim')

" Improved syntax highlighting and indentation
call minpac#add('othree/yajs.vim')

" === UI === "
" File explorer
call minpac#add('scrooloose/nerdtree')

" Colorscheme
call minpac#add('morhetz/gruvbox')

" Icons
call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')

" manage plugins
call minpac#add('k-takata/minpac', {'type': 'opt'})

" comment related (add/format/del ...)
call minpac#add('scrooloose/nerdcommenter')

" execute angular-cli commands
call minpac#add('bdauria/angular-cli.vim')
