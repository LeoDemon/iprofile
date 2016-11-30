" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"echo "You are the Best! Just do it !!"
"echo "       "
"echo "But, please keep modest..."

set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set encoding=utf-8
set fileencodings=gb2312,ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,chinese
"set termencoding=cp936
if has("win32")
    set fileencoding=gb2312
else
    set fileencoding=utf-8
endif
language messages zh_CN.utf-8

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set number
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set tags=tags;
set autochdir
" ctags 索引文件 (根据已经生成的索引文件添加即可)
"set tags+=/media/leodemon/Study/Study/Soft/WorkSoft/gvim/sys_tags/cpp_tags

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber

let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_Menu=1
let Tlist_Exit_OnlyWindow=1

let g:AutoOpenWinManager = 1
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWindowLayout = "NERDTree|TagList"
"let g:winManagerWindowLayout = "NERDTree|TagList,BufExplorer"
let g:winManagerWidth = 30
nmap <silent> <F7> :WMToggle<cr>

let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr>

"NerdTree, add by Leo 2014.5.29
nmap <silent> <F10> :NERDTreeToggle<cr>

let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()
    exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

"tagbar
nmap <F8> :TagbarToggle<CR>

set nocp
filetype plugin on
filetype plugin indent on
"set foldmethod=indent "根据缩进的折行
"使用语法高亮定义代码折叠
set foldmethod=syntax
"打开文件是默认不折叠代码
set foldlevelstart=99

"wh替代while
"imap wh while
"imap pb public
"imap pr private

"目录快捷键
:command Vimrc edit /etc/vim/vimrc
:command Work edit /home/leostudio/coding/coding_for_work
:command Study edit /home/leostudio/coding/coding_for_study
:command Mycpp edit /home/leostudio/coding/coding_for_study/cpplab
:command Myjava edit /home/leostudio/coding/coding_for_study/javalab
:command Mypy edit /home/leostudio/coding/coding_for_study/PythonNow
"安徽发布工作区
:command Ahcdf edit /home/leostudio/coding/coding_for_work/anhui/framework
:command Ahcbo edit /home/leostudio/coding/coding_for_work/anhui/framework/src/border/
:command Ahcbi edit /home/leostudio/coding/coding_for_work/anhui/framework/src/border/interface/

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
" 改变自动补全窗口的配色
highlight Pmenu    guibg=pink  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black
" mapping自动补全选择
"inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>       pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"

" ======= 引号 && 括号自动匹配 ======= "
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
" :inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i
:inoremap ? ??<ESC>i
":inoremap . ..<ESC>i
function ClosePair(char)
    if getline('.')[col('.')-1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

"cscope插件
"run the 3 commands below, then generate the cscope.files
"find . -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.pc" -o -name "*.c" -o -name "*.cc" > cscope.files
"cscope -bkq -i cscope.files
"ctags -R

cs a /home/leostudio/coding/coding_for_study/cpplab/cscope.out
cs a /home/leostudio/coding/coding_for_work/anhui/framework/cscope.out

set cscopetag					" Use both cscope and ctag
set cscopeverbose				" Show msg when cscope db added
set cscopequickfix=s-,c-,d-,i-,t-,e-	" Use quickfix window to show cscope results
let Cscope_OpenQuickfixWindow=1

"modify by hz 20130116
function! AutoLoadDB()
    "1. Loading cscope.out
    if has("cscope")
        cs kill -1     " Kill all of the previous cscope.out first,then add new cscope.out
        set csprg=/usr/bin/cscope
        set csto=0			" Use cscope for definition search first,then use tags
        set cst
        set nocsverb
        set cspc=3
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope*.out
            "else search cscope.out elsewhere
        else
            let cscope_file=findfile("cscope.out", ".;")
            let cscope_pre=matchstr(cscope_file, ".*/")
            if !empty(cscope_file) && filereadable(cscope_file)
                exe "cs add" cscope_file cscope_pre
            endif
        endif
    endif
    "2. Loading LookupFile's filenametags
    "find . -not -regex '.*\.\(png\|gif\)' '.*temp\.*' -type f -printf "%f\t%p\t1\n" | \ sort -f >> filenametags
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    let ah_match=matchstr(curdir, "ah-fb-gzq")
    let sx_match=matchstr(curdir, "sx-fb-gzq")
    let test_match=matchstr(curdir, "space-for-study")
    if !empty(ah_match)
        let g:LookupFile_TagExpr = '"~/Study/workspace/space-for-job/ah-fb-gzq/filenametags"'
    elseif !empty(sx_match)
        let g:LookupFile_TagExpr = '"~/Study/workspace/space-for-job/sx-fb-gzq/filenametags"'
    elseif !empty(test_match)
        let g:LookupFile_TagExpr = '"~/Study/workspace/space-for-study/cpp-space/filenametags"'
    else
        let g:LookupFile_TagExpr = '"~/Study/workspace/space-for-job/ah-fb-gzq/filenametags"'
    endif
endfunction

"When change the dir,then call function AutoLoadDB
autocmd bufenter * call AutoLoadDB()

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

"grep.vim
nnoremap <silent> <F3> :Grep<CR>

"minibufexpl.vim多文件编辑
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1


"new add by 20120825
set cursorline              " 突出显示当前行
"hi cursorline guibg=#636007 ctermbg=236 cterm=none "显示当前行的背景颜色
hi CursorLine cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
"hi CursorColumn guibg=darkred ctermbg=darkred cterm=NONE"显示当前列的背景颜色

set tabstop=4               " 设定 tab 长度为 4
set shiftwidth=4            " 使用每层缩进的空格数为4
set expandtab               " 使用space代替tab.
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hlsearch                " 搜索时高亮显示被找到的文本
set magic                   " 设置魔术(默认就是该选项)
set smartindent             " 开启新行时使用智能自动缩进
set guioptions-=T          " 隐藏工具栏
"set guioptions-=m          " 隐藏菜单栏
"set shortmess=atI			" 去掉欢迎界面
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set noswf					" 去掉烦人的交换文件
set showmatch               " 显示括号配对情况
" 读文件时自动设定当前目录为刚读入文件所在的目录
autocmd BufReadPost * cd %:p:h

nmap <F4> :%s/[ \t\r]\+$//gn<CR>  " 显示所有行未尾空格
nmap <F6> :%s/[ \t\r]\+$//g<CR>  " 删除所有行未尾空格
"nnoremap <F6> :call g:Jsbeautify()<CR> "js函数格式化
"nmap <F7> :<leader>gg=G<CR> "C++代码格式化


"new add by hz 20121222
set display=lastline  "解决过长的行显示不全的问题
syntax sync fromstart "解决代码高亮不正常的问题
"google、有道在线翻译插件
"nmap <F10> :echo Google_Translate('en','zh-CN',expand('')) <cr>
"map <F1> :call ToggleSketch()<CR> "使用Sketch.vim画草图

"using powerline :new add by hz 20130113
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
let g:Powerline_colorscheme='solarized256'
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
"set guifont=Droid\ Sans\ Mono\ 11
set guifont=YaHei\ Consolas\ Hybrid\ 13
"set guifontwide=YaHei\ Consolas\ Hybrid:h10
"highlight statusLine cterm=bold ctermfg=yellow ctermbg=blue
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\    " 设置在状态行显示的信息
" 获取当前路径，将$HOME转化为~
"function! CurDir()
"    let curdir = substitute(getcwd(), $HOME, "~", "g")
"    return curdir
"endfunction

"using lookupfile :new add by hz 20130115
""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 3               "最少输入3个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"每次自动加载filenametags在函数AutoLoadDB

"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>

"copy filename and filepath to win7's clipboard  :new add by hz 20130129
":let doesname =expand("%:t")
iab fname <c-r>=expand("%:t")<CR>
iab fpath <c-r>=expand("%:p")<CR>
iab xdate <c-r>=strftime("%Y-%m-%d")<CR>
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>

nmap <C-R>y :let @+<c-r>=expand("%")<CR>

"for indent-line(https://github.com/Yggdroot/indentLine), add by Leo 2014.5.27
"g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_term = 239
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1
let g:indentLine_char = '┆'

"FuzzyFinder plugin , add by Leo 2014.5.29
nmap <silent> <leader>ff :FufFile<CR>
nmap <silent> <leader>fb :FufBuffer<CR>
nmap <silent> <leader>fd :FufDir<CR>
nmap <silent> <leader>fl :FufLine<CR>
nmap <silent> <leader>fk :FufBookmark<CR>
nmap <silent> <leader>ft :FufTag<CR>

"CtrlP plugin, add by Leo 2014.5.29
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
            \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"nerdcommenter plugin,add by Leo 2014.6.5
nmap <silent> <leader>cc :NERDComComment<CR>
nmap <silent> <leader>cu :NERDComUncommentLine<CR>


"vundle manage vim plugin, add by Leo 2014.6.22
set nocompatible              " be iMproved
"filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'Valloric/ListToggle'
"Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 't9md/vim-quickhl'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/AutoClose'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Yggdroot/indentLine'
Bundle 'marijnh/tern_for_vim'
Bundle 'tpope/vim-pathogen'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Raimondi/delimitMate'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/vimwiki'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'hdima/python-syntax'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
"Bundle 'VimIM'
Bundle 'taglist.vim'
Bundle 'c.vim'
Bundle 'a.vim'
"Bundle 'minibufexpl.vim'
Bundle 'bufexplorer.zip'
Bundle 'winmanager'
Bundle 'OmniCppComplete'
Bundle 'grep.vim'
Bundle 'mru.vim'
"Bundle 'comments.vim'
Bundle 'tagbar'
Bundle 'genutils'
Bundle 'lookupfile'
Bundle 'code_complete'
Bundle 'LargeFile'
Bundle 'flazz/vim-colorschemes'
"Bundle 'TabBar'
Bundle 'mileszs/ack.vim'
Bundle 'JavaBrowser'
Bundle 'https://github.com/neilagabriel/vim-geeknote'
Bundle 'vim-scripts/indentpython.vim'
Bundle 'DrawIt'

" non-GitHub repos
Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!

""""""""""syntastic""""""""""""
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
let g:syntastic_enable_balloons = 1
let g:syntastic_always_populate_loc_list = 1

""""""""""""YCM""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='~/Study/workspace/space-for-study/cpp-space/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
"force recomile with syntastic
nnoremap <F12> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"括号匹配高亮 kien/rainbow_parentheses.vim
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['blck',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0

"快速插入代码片段 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["snippets", \"bundle/ultisnips/UltiSnips"]

"自动补全单引号，双引号等 'Raimondi/delimitMate'
" for python docstring ",优化输入
"au FileType python let b:delimitMate_nesting_quotes = ['"']

"for code alignment 'godlygeek/tabular'
" \bb                 按=号对齐代码 [Tabular插件]
nmap <leader>bb :Tab /=<CR>
" \bn                 自定义对齐    [Tabular插件]
nmap <leader>bn :Tab /

"for TaskList.vim'
map <leader>td <Plug>TaskList

"for vimwiki plugin
let g:vimwiki_w32_dir_enc     = 'utf-8' " 设置编码
let g:vimwiki_use_mouse       = 1       " 使用鼠标映射
let g:vimwiki_valid_html_tags = 'a,img,b,i,s,u,sub,sup,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,script,style'
                                        " 声明可以在wiki里面使用的HTML标签
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0

let blog = {}
""if g:isWIN
""    if g:atCompany
""        let blog.path          = 'D:/Files/Files/mysite/wiki/'
""        let blog.path_html     = 'D:/Files/Files/mysite/html/'
""        let blog.template_path = 'D:/Files/Files/mysite/templates/'
""        let blog.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
""    else
""        let blog.path          = 'D:/Files/mysite/wiki/'
""        let blog.path_html     = 'D:/Files/mysite/html/'
""        let blog.template_path = 'D:/Files/mysite/templates/'
""        let blog.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
""    endif
""else
    let blog.path          = '~/mysite/wiki/'
    let blog.path_html     = '~/mysite/html/'
    let blog.template_path = '~/mysite/templates/'
""endif
let blog.template_default  = 'site'
let blog.template_ext      = '.html'
let blog.auto_export       = 1

let g:vimwiki_list = [blog]

"for mutil cursor vim-multiple-cursors plugin
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"python syntax highlight, for python-syntax plugin
let python_highlight_all = 1

"fullscreen
fun! ToggleFullscreen()		" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

function! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

"max window when start gvim
if has('win32')
    au GUIEnter * simalt ~x
else
    au GUIEnter * call MaximizeWindow()
endif

"全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
"autocmd VimEnter * call ToggleFullscreen()	" 启动 vim 时自动全屏

"max window (when start the gvim , max the window)
"autocmd VimEnter * winsize 168 45

"每次保存文件时，自动更新tags
"autocmd BufWritePost *.cpp,*.c,*.h :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q

"for deal large file, add by Leo 2014.7.30
let g:LargeFile=10

"for backup orignal file
set patchmode=.orig

"20160703
colorscheme  spring "spring murphy  default zellner desert
"Ack plugin
map <F2> :Ack -i 
"JavaBrowser plugin
let JavaBrowser_Ctags_Cmd = '/usr/bin/ctags'
let Javabrowser_Use_Icon = 1
let JavaBrowser_Use_Highlight_Tag = 1

"setting python-mode plugin(:help pymode), 2016.9.29
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_python = 'python'
"block python-mode colorcolumn
let g:pymode_options_colorcolumn = 0

"highlight the background in a subtle red for text that goes over the 80 column limit 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


"setting <C-n> for <Down> and <C-p> for <Up>, 2016.10.7
"let <C-n> and <C-p> can filter the Command History
"see Tip34 on page 69 in book <<Practical Vim>> English Edition
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"setting shortcut key for :bn,:bp,:bfirst,:blast in the buffer
"see Tip36 on page 79 in book <<Practical Vim>> English Edition
"add by 2016.10.8
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

"setting shortcut key for %:h<Tab>, add by 2016.10.9
"so you can type ':edit' or ':write'...then press '%%'
"see Tip41 on page 95 in book <<Practical Vim>> English Edition
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"get the codes path for 'find' command
set path+=/home/leostudio/coding/**

