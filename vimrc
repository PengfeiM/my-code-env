" Configuration file for vim
set modelines=0		" CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility set backspace=2		" more powerful backspacing
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" use powerful backspace
set backspace=2

let skip_defaults_vim=1

set t_Co=256
"set termguicolors
" Enable true color 启用终端24位色
"if exists('+termguicolors')
  "let &t_8f = \<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b = \<Esc>[48;2;%lu;%lu;%lum"
  "set termguicolors
"endif

if has("termguicolors")
    " fix bug for vim 注意下方的^[代表ESC，需要在vim中按Ctrl-v ESC来输入（^[不是文字字符！）
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
    " enable true color 
    set termguicolors
endif

" gui cursor
let &t_SI = "\e[4 q"
let &t_EI = "\e[4 q"
let &t_SR = "\e[4 q"

"set background=dark

scriptencoding utf-8

set showmode
" line number
set nu
" highlight current line & column
set cursorline
"set cursorcolumn
" code highlight
syntax enable 
syntax on
" auto indent

"格式化配置{

    set wrap                        " Do wrap long lines
    set linespace=0
    set cc=80
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set tabstop=4                   " An indentation every four columns
    set expandtab                   " Tabs are spaces, not tabs
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set matchpairs+=<:>             " Match, to be used with %
    set showmatch
    autocmd FileType c,cpp,go,python,xml,yaml,perl,sql,json autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    "autocmd FileType go setlocal expandtab
    autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd BufRead,BufNewFile *.json.tpl setlocal filetype=json 
    "autocmd FileType json :IndentLinesDisable
    autocmd BufRead,BufNewFile *.toml.tpl,*gobgp* setlocal filetype=toml
    autocmd BufRead,BufNewFile *local*machine* setlocal filetype=yaml
    autocmd BufRead,BufNewFile preinst,postinst,prerm,postrm setlocal filetype=bash
    autocmd FileType go,json set list lcs=tab:\┊\  "(last character is a space...) " go,json indentline
    autocmd FileType go,json hi SpecialKey ctermfg=gray      
"}




if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif

" system clipboard
" 支持在Visual模式下，通过C-y复制到系统剪切板
vnoremap <C-y> "+y"
" " 支持在normal模式下，通过C-p粘贴系统剪切板
nnoremap <C-p> "*p"

" highlight search
set hls
" 忽略大小写
set ignorecase
set smartcase
" 实时搜索
set incsearch
set wildmenu                    " Show list instead of just completing
set foldenable                  " Auto fold code
set spell
set spelllang=en,cjk
set spelloptions=camel
    

" powerline
"set rtp+=~/.tmux/Plugs/powerline/powerline/bindings/vim/
"set laststatus=2

" auto save 自动保存
au InsertLeave *.sh,*.md,*.c,*.cpp write



" 定义快捷键的前缀，即<Leader>
let mapleader=";" 

 "简化窗口操作
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap <C-L> <C-W>l<C-W>_
nmap <C-H> <C-W>h<C-W>_
nmap <leader>= <C-W>=


" buffer相关
set hidden 


" Plug Manager
"filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

" alternatively, pass a path where Vundle should install Plugs
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plug 'gmarik/Vundle.vim'

" translation
Plug 'voldikss/vim-translator'



" markdown preview
Plug 'iamcco/markdown-preview.nvim'
Plug 'preservim/vim-markdown'

" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'

" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" 查看当前代码文件中的变量和函数列表的插件，
" " 可以切换和跳转到代码中对应的变量和函数的位置
" " 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'majutsushi/tagbar'
Plug 'jstemmer/gotags'

" 可以在 vim 中使用 tab 补全
"Plug 'vim-scripts/SuperTab'

"目录树
Plug 'scrooloose/nerdtree'  

" git状态
Plug 'Xuyuanp/nerdtree-git-plugin'  

" open repo in browser
Plug 'ruanyl/vim-gh-line'

"airline
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts'
"Plug 'jlanzarotta/bufexplorer'
" 关闭全部的Buff, 除了当前的
Plug 'vim-scripts/BufOnly.vim'

" 通用
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'osyo-manga/vim-over'
Plug 'gcmt/wildfire.vim'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'godlygeek/tabular'

" code general
Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/syntastic'
Plug 'mattn/gist-vim'
Plug 'rbong/vim-flog'

" powerline
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}

" vim  theme
" 主题
Plug 'joshdick/onedark.vim'
"Plug 'olimorris/onedarkpro.nvim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'sainnhe/edge'
Plug 'hzchirs/vim-material'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'kyoz/purify', {'rtp': 'vim'}
"Plug 'yuttie/hydrangea-vim'
"Plug 'yonlu/omni.vim'

Plug 'tmhedberg/SimpylFold'

Plug 'scrooloose/nerdcommenter'

" 代码自动完成，安装完插件还需要额外配置才可以使用
Plug 'Valloric/YouCompleteMe'



" 缩进提示
Plug 'Yggdroot/indentLine'

" 语法高粱
Plug 'vim-syntastic/syntastic'


" go 主要插件
Plug 'fatih/vim-go', { 'tag': '*' }
" " go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'
" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

" -------------------------------
" python
Plug 'Chiel92/vim-autoformat'
Plug 'klen/python-mode'
Plug 'yssource/python.vim'
Plug 'yegle/python_match'
"Plug 'pythoncomplete'
"Plug 'scrooloose/syntastic'
Plug 'jmcantrell/vim-virtualenv'
"Plug 'w0rp/ale'

" c/cpp
Plug 'derekwyatt/vim-fswitch'
Plug 'rhysd/vim-clang-format'




Plug 'blueyed/smarty.vim'

" 彩虹括号
Plug 'kien/rainbow_parentheses.vim'

" fzf
set rtp+=~/.fzf
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'


" Add all your Plugs here (note older versions of Vundle used Bundle instead of Plug)
" All of your Plugs must be added before the following line
call plug#end()            " required
"filetype  indent on    " required
"filetype on
"filetype plugin on
"filetype indent on





" --- 主题配置-------------
let g:dracula_colorterm=0
let g:dracula_italic=1
let g:dracula_bold=1

let g:edge_style = 'aura'
let g:edge_better_performance = 1
let g:edge_enable_italic = 1
let g:edge_cursor = 'auto'
let g:edge_transparent_background = 1
let g:edge_diagnostic_text_highlight = 1

let g:material_style='palenight'
" theme selection
"colorscheme onedark
colorscheme dracula
"colorscheme edge
"colorscheme vim-material
"colorscheme purify
"colorscheme catppuccin_macchiato    "catppuccin_frappe  catppuccin_latte  catppuccin_macchiato  catppuccin_mocha
" dracula bug fix
set t_ZH=[3m
set t_ZR=[23m

highlight Comment cterm=italic	 " 注释斜体
hi Normal guibg=NONE ctermbg=NONE " 背景透明



" ------------------------------------------------
" 设置NerdTree
" shortcut
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"autocmd vimenter * NERDTree 
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeNaturalSort=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=32
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=1
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=0
let NERDTreeKeepTreeInNewTab=1
let NERDTreeAutoDeleteBuffer=1 " 删除文件时自动删除文件对应 buffer
let g:nerdtree_tabs_open_on_gui_startup=0

let s:go_blue = "77BBE2" " self-def go file's color
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['go'] = s:go_blue " sets the color of go files to blue
let g:webdevicons_enable_nerdtree = 1

" -----------------------------------------------



" ==================markdown======================
" -----------------vim-markdown-------------------
"
"  目录大小自适应
let g:vim_markdown_toc_autofit = 1
nmap <Leader>mt :Toc<CR>
" 隐藏一些标记
"autocmd FileType md setlocal conceallevel=2
" 不隐藏数学公式的标记
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" 不隐藏 code 块的标记
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" LaTex math
let g:vim_markdown_math = 1
" highlight some conf file
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1


" -----------------------------------------------
    " md preview shortcut
    map <F4> :MarkdownPreview<CR>
    " set to 1, nvim will open the preview window after entering the markdown buffer
    " default: 0
    let g:mkdp_auto_start = 0

    " set to 1, the nvim will auto close current preview window when change
    " from markdown buffer to another buffer
    " default: 1
    let g:mkdp_auto_close = 0

    " set to 1, the vim will refresh markdown when save the buffer or
    " leave from insert mode, default 0 is auto refresh markdown as you edit or
    " move the cursor
    " default: 0
    let g:mkdp_refresh_slow = 0

    " set to 1, the MarkdownPreview command can be use for all files,
    " by default it can be use in markdown file
    " default: 0
    let g:mkdp_command_for_global = 0

    " set to 1, preview server available to others in your network
    " by default, the server listens on localhost (127.0.0.1)
    " default: 0
    let g:mkdp_open_to_the_world = 0

    " use custom IP to open preview page
    " useful when you work in remote vim and preview on local browser
    " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
    " default empty
    let g:mkdp_open_ip = ''

    " specify browser to open preview page
    " for path with space
    " valid: `/path/with\ space/xxx`
    " invalid: `/path/with\\ space/xxx`
    " default: ''
    let g:mkdp_browser = ''

    " set to 1, echo preview page url in command line when open preview page
    " default is 0
    let g:mkdp_echo_preview_url = 1

    " a custom vim function name to open preview page
    " this function will receive url as param
    " default is empty
    let g:mkdp_browserfunc = ''

    " options for markdown render
    " mkit: markdown-it options for render
    " katex: katex options for math
    " uml: markdown-it-plantuml options
    " maid: mermaid options
    " disable_sync_scroll: if disable sync scroll, default 0
    " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
    "   middle: mean the cursor position alway show at the middle of the preview page
    "   top: mean the vim top viewport alway show at the top of the preview page
    "   relative: mean the cursor position alway show at the relative positon of the preview page
    " hide_yaml_meta: if hide yaml metadata, default is 1
    " sequence_diagrams: js-sequence-diagrams options
    " content_editable: if enable content editable for preview page, default: v:false
    " disable_filename: if disable filename header for preview page, default: 0
    let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 0,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {},
        \ 'flowchart_diagrams': {},
        \ 'content_editable': v:false,
        \ 'disable_filename': 0,
        \ 'toc': {}
        \ }

    " use a custom markdown style must be absolute path
    " like '/Users/username/markdown.css' or expand('~/markdown.css')
    let g:mkdp_markdown_css = ''

    " use a custom highlight style must absolute path
    " like '/Users/username/highlight.css' or expand('~/highlight.css')
    let g:mkdp_highlight_css = ''

    " use a custom port to start server or empty for random
    let g:mkdp_port = ''

    " preview page title
    " ${name} will be replace with the file name
    let g:mkdp_page_title = '「${name}」'

    " recognized filetypes
    " these filetypes will have MarkdownPreview... commands
    let g:mkdp_filetypes = ['markdown']

    " set default theme (dark or light)
    " By default the theme is define according to the preferences of the system
    "let g:mkdp_theme = 'dark'


" -----------------------------------------------

" ====== vim-syntastic/syntastic===========
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set signcolumn=yes
let g:syntastic_auto_jump = 2
let g:syntastic_extra_filetypes = [ "make", "gitcommit" ]



" ----------------------------------------------------------------------------------------
let g:go_autodetect_gopath=1
let g:go_list_type = "quickfix"

"let g:go_fold_enable=1

let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_extra_types=1
let g:go_def_mode='godef'
let g:go_highlight_function_parameters=1
let g:go_highlight_function_calls=1
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_highlight_variable_declarations=1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"let g:godef_split=0
"let g:godef_same_file_in_same_window=1

au FileType go nmap <Leader>gi <Plug>(go-implements)
au FileType go nmap <Leader>gr :GoReferrers<CR>

" —————————————-------------------------
"
"


"==============================================================================
""  majutsushi/tagbar 插件
"==============================================================================
"
"" majutsushi/tagbar 插件打开关闭快捷键
nmap <F9> :TagbarToggle<CR>

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

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
    \],
    \ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\},
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\},
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
	\}

" markdown
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }


let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
" autocmd vimenter * TagbarToggle
" ------------------------------------------------------------------------------




"buffer line config 
"let g:bufferline_echo = 1
"let g:bufferline_active_buffer_left = '<'
"let g:bufferline_active_buffer_right = '>'
"let g:bufferline_show_bufnr = 1
":nn <Leader>1 :b 1<CR>
":nn <Leader>2 :b 2<CR>
":nn <Leader>3 :b 3<CR>
":nn <Leader>4 :b 4<CR>
":nn <Leader>5 :b 5<CR>
":nn <Leader>6 :b 6<CR>
":nn <Leader>7 :b 7<CR>
":nn <Leader>8 :b 8<CR>
":nn <Leader>9 :b 9<CR>
:nn <Leader>bn :bn<CR>
:nn <Leader>bp :bp<CR>
" ;bd 关闭但前缓冲区, 不关闭窗口
map <leader>bd :Bclose<cr>:tabclose<cr>gT
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")
   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif
   if bufnr("%") == l:currentBufNum
     new
   endif
   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
" 关闭初当前Buffer外的所有Buffer
nmap <Leader>bo :BufOnly<CR>:AirlineRefresh<CR>
autocmd quitpre * :bd




" airline 
let g:airline_experimental = 0
" 总是显示状态栏 
let laststatus = 2
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
let g:airline_theme="dracula"      " 设置主题
"let g:airline_theme="edge"
"let g:airline_theme="material"
"let g:airline_theme="catppuccin_macchiato"
"let g:airline_theme="purify"
"let g:airline_theme="atomic"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep=''  " Slightly fancier than '>›'
let g:airline_right_sep='' " Slightly fancier than '<‹'
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1
let g:airline_symbols.spell = 'Ꞩ'
let g:airline#extensions#bufferline#enabled = 0
"let g:airline#extensions#bufferline#buffer_idx_mode=1
 " 开启tabline
let g:airline#extensions#tabline#enabled = 1
 "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = '' "'\uE0B1'
let g:airline#extensions#tabline#right_sep = ''
 "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_alt_sep = '|'
 "tabline中buffer显示编号
"let g:airline#extensions#tabline#buffer_nr_show = 1      
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
    \ '0': '0 ',
    \ '1': '1 ',
    \ '2': '2 ',
    \ '3': '3 ',
    \ '4': '4 ',
    \ '5': '5 ',
    \ '6': '6 ',
    \ '7': '7 ',
    \ '8': '8 ',
    \ '9': '9 '
    \}

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" py 虚拟环境
let g:airline#extensions#virtualenv#enabled = 1
"let g:virtualenv_directory = './venv/'
let g:airline#extensions#virtualenv#ft = ['python']
let g:virtualenv_stl_format = '[%n]'
" ycm airline integration
let g:airline#extensions#ycm#enabled = 1
" fzf
let g:airline#extensions#fzf#enabled = 1
" tagbar
let g:airline#extensions#tagbar#enabled = 1
" file icons
let g:webdevicons_enable_airline_tabline = 1 " adding to vim-airline's tabline
let g:webdevicons_enable_airline_statusline = 1 " adding to vim-airline's statusline
let g:airline_detect_spell=1
"let g:airline_section_x = (tagbar, %{WebDevIconsGetFileTypeSymbol()}, virtualenv)
" add or override individual additional filetypes  
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['toml'] = '𝓣'



" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
"let g:indentLine_char='¦' 
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" 使indentline生效
let g:indentLine_enabled = 1 
let g:indentLine_setConceal = 1
" 排除文件格式
let g:indentLine_fileTypeExclude = ['json']
" 领头空格
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_leadingSpaceChar = '˰'  " You also can use other characters:˽˰··
"let g:indentLine_conceallevel = 0


"====== Autoformat ============================
nmap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 1
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1

au BufWrite *.go,*.py :Autoformat
"au BufWrite *.py,*.c,*.cpp :Autoformat
"=============================================
"

" ===== clang-format =========================
let g:clang_format#auto_format=1
augroup ClangFormatSettings
    autocmd!
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    " if you install vim-operator-user
    autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
augroup END
au BufWrite *.c,*.cpp :ClangFormat




"python {
    if !has('python') && !has('python3')
        let g:pymode = 0
    endif

    let g:pymode_lint_checkers = ['pep8', 'pyflakes']
    let g:pymode_trim_whitespaces = 1
    let g:pymode_options = 0
    let g:pymode_options_max_line_length = 79
    let g:pymode_options_colorcolumn = 1
    let g:pymode_quickfix_minheight = 2
    let g:pymode_quickfix_maxheight = 6
    let g:pymode_preview_position = 'botright'
    let g:pymode_rope = 0
    let g:pymode_lint = 1
    let g:pymode_lint_on_write = 1
    let g:pymode_lint_message = 1
    let g:pymode_lint_cwindow = 1
    let g:pymode_lint_ignore = ["E501"]
    let g:pymode_lint_signs = 1
    let g:pymode_lint_todo_symbol = 'WW'
    let g:pymode_lint_comment_symbol = 'CC'
    let g:pymode_lint_visual_symbol = 'RR'
    let g:pymode_lint_error_symbol = 'EE'
    let g:pymode_lint_info_symbol = 'II'
    let g:pymode_lint_pyflakes_symbol = 'FF'
    "let g:pymode_lint_options_pep8 = {'max_line_length': 120}
    "let g:pymode_lint_options_pyflakes = {'max_line_length': 120}
    let g:pymode_syntax = 1
    let g:pymode_syntax_all = 1
    let g:pymode_syntax_print_as_function = 0
    let g:pymode_syntax_highlight_async_await = g:pymode_syntax_all
    let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
    let g:pymode_syntax_highlight_self = g:pymode_syntax_all
    let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
    let g:pymode_syntax_indent_errors = g:pymode_syntax_all
    let g:pymode_syntax_space_errors = g:pymode_syntax_all
    let g:pymode_syntax_string_formatting = g:pymode_syntax_all
    let g:pymode_syntax_string_format = g:pymode_syntax_all
    let g:pymode_syntax_string_templates = g:pymode_syntax_all
    let g:pymode_syntax_doctests = g:pymode_syntax_all
    let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
    let g:pymode_syntax_builtin_types = g:pymode_syntax_all
    let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
    let g:pymode_syntax_docstrings = g:pymode_syntax_all

    let g:syntastic_python_checkers = ["pep8", "pyflakes"]
    let g:syntastic_python_flake8_args="--ignore=E501"
    let g:syntastic_python_pep8_args="--ignore=E501,W601"

    "autocmd InsertLeave *.py :PymodeLint<CR>
"}

" fzf
"fzf {
    command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)
    nnoremap <silent> <Leader>a :Ack <C-R>=expand("<cword>")<CR><CR>
    nnoremap <silent> <leader>bb :Buffers<CR>
    nnoremap <silent> <leader>f :Files<CR>
    nnoremap <silent> <leader>w :Windows<CR>
    nnoremap <silent> <leader>h :History<CR>
"}
let g:ackprg='ag --column --smart-case'
"let g:ackprg='ag --nogroup --nocolor --column --smart-case'
nmap <Leader>F :Ack <space>
" todo list
command! Todo Ack TODO\|FIXME 
nmap <Leader>td :Ag TODO\|FIXME<CR>



" fold code
let g:SimpylFold_docstring_preview=1
set foldmethod=indent
set foldlevel=99

" comment
map <F7> <leader>ci


" ============= you complete me===========================================
" config file path
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=1
" log
let g:ycm_server_keep_logfiles=1
"补全菜单的开启与关闭
set completeopt=longest,menu                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_autoclose_preview_window_after_completion=1      " 自动关闭自动补全窗口"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
let g:ycm_key_list_stop_completion = ['<CR>']


" 开启各种补全引擎
let g:ycm_collect_identifiers_from_tags_files=1         " 开启 YCM
"基于标签引擎
let g:ycm_auto_trigger = 1                  " 开启 YCM
"基于标识符补全，默认为1
let g:ycm_seed_identifiers_with_syntax=1                " 开启 YCM
"基于语法关键字补全
let g:ycm_complete_in_comments = 1              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
let g:ycm_max_diagnostics_to_display = 30 "maximum number of diagnostics shown to the user when errors or warnings are detected in the file


" python 
"python解释器路径"
let g:ycm_path_to_python_interpreter='/opt/homebrew/bin/python3'
let g:ycm_python_binary_path = '/opt/homebrew/bin/python3'
let g:ycm_server_python_interpreter='/opt/homebrew/bin/python3'

"按下2个字母后自动语意补全(检测上下文环境)
let g:ycm_semantic_triggers = {
\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
\ 'cs,lua,javascript': ['re!\w{2}'],
\ }

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

" git 配置
nmap <Leader>gt :Git<space>
"git-gh 配置：gitlab 地址 github地址
let g:gh_gitlab_domain = ""
let g:gh_github_domain = "github.com"

" c/cpp
nmap <slient><Leader>sw :FSHere<cr>





" 调用shell
map <Leader>sh :Shell<space>


nmap <leader>wq :wq<CR>
nmap <leader>wa :wall<CR>
nmap <leader>q :q<CR>
nmap <leader>qa :wqall<CR>

" 翻译
" Display translation in a window
nmap <silent> <Leader>t <Plug>TranslateW
vmap <silent> <Leader>t <Plug>TranslateWV


" JSON {
    "nmap <leader>jt <Esc>:%!python3 -m json.tool<CR><Esc>:set filetype=json<CR>
    nmap <leader>jt <Esc>:%!python3 -m json.tool --no-ensure-ascii<CR><Esc>:set filetype=json<CR>
    let g:vim_json_syntax_conceal = 0
" }

" do not hide any quotation marks
set conceallevel=0


" 公共函数
"{

    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction



" 执行Shell命令 {
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
"}
