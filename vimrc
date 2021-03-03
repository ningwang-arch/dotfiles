set nocompatible
filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Vundle/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdtree'
Plugin 'chiel92/vim-autoformat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/dbext.vim'
call vundle#end()
filetype plugin indent on

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_server_keep_logfiles=1
let g:ycm_semantic_triggers =  {
			\   'c' : ['->', '.','re!\w{1}'],
			\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
			\             're!\[.*\]\s'],
			\   'cpp,objcpp' : ['->', '.', '::','re!\w{1}'],
			\   'java,python' : ['.','re!\w{1}'],
			\ }


let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui= 0
let g:ycm_server_log_level = 'info'
set completeopt=longest,menu

" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0

" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1

" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2

" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1

" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1

" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1



let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
let g:syntastic_python_checkers=['pyflakes']


let g:omni_sql_default_compl_type='syntax'


map<F3> :NERDTreeToggle<CR>

" au BufWrite * :Autoformat
autocmd FileType python let g:autoformatpython_enabled = 1
let g:formatdef_clangformat_google = '"astyle --style=google"'
let g:formatters_c = ['clangformat_google']
let g:formatters_cpp=['clangformat_google']

let mapleader=","

set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fencs=utf8,gbk,gb2312,gb18030

set relativenumber
"set nu
set cursorline
set tabstop=4
set shiftwidth=4
set autoindent
set laststatus=2
set ruler
syntax on
set textwidth=80
set nowrap
set linebreak
set shortmess=atI
set smarttab
set smartindent
set showcmd
set showmatch
set nobackup
set noswapfile
"set hlsearch
set incsearch
set foldmethod=marker
set statusline=%1*\%<%.50f
set statusline+=%=%2*\%y%m%r%h%w\ %*
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*
set statusline+=%4*\ row:%l/%L,col:%c\ %*
set statusline+=%5*\%3p%%\%*
"hi User1 cterm=none ctermfg=25 ctermbg=0
"hi User2 cterm=none ctermfg=208 ctermbg=0
"hi User3 cterm=none ctermfg=169 ctermbg=0
"hi User4 cterm=none ctermfg=100 ctermbg=0
"hi User5 cterm=none ctermfg=green ctermbg=0
