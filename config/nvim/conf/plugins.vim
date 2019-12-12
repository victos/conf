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

" Tmux/Neovim movement integration
call minpac#add('christoomey/vim-tmux-navigator')

" Denite - Fuzzy finding, buffer management
call minpac#add('Shougo/denite.nvim')

" Snippet support
call minpac#add('Shougo/neosnippet')
call minpac#add('Shougo/neosnippet-snippets')

" Print function signatures in echo area
call minpac#add('Shougo/echodoc.vim')

" === Git Plugins === "
" Enable git changes to be shown in sign column
call minpac#add('mhinz/vim-signify')
call minpac#add('tpope/vim-fugitive')

" === Javascript Plugins === "
" Typescript syntax highlighting
call minpac#add('HerringtonDarkholme/yats.vim')

" ReactJS JSX syntax highlighting
call minpac#add('mxw/vim-jsx')

" Generate JSDoc commands based on function signature
call minpac#add('heavenshell/vim-jsdoc')

" === Syntax Highlighting === "

" Syntax highlighting for nginx
call minpac#add('chr4/nginx.vim')

" Syntax highlighting for javascript libraries
call minpac#add('othree/javascript-libraries-syntax.vim')

" Improved syntax highlighting and indentation
call minpac#add('othree/yajs.vim')

" === UI === "
" File explorer
call minpac#add('scrooloose/nerdtree')

" Colorscheme
call minpac#add('mhartington/oceanic-next')

" Customized vim status line
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" Icons
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')


" open items from vim's quickfix or location list
call minpac#add('yssl/QFEnter')

" manage plugins
call minpac#add('k-takata/minpac', {'type': 'opt'})

" improve the experence when you write html/css
call minpac#add('mattn/emmet-vim')

" comment related (add/format/del ...)
call minpac#add('scrooloose/nerdcommenter')

" execute angular-cli commands
call minpac#add('bdauria/angular-cli.vim')
call minpac#add('derekwyatt/vim-scala')
