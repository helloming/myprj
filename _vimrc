set nocompatible
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim7.1在windows下的编码设置。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8

set fileencodings=utf-8,chinese,latin-1

if has("win32")

 set fileencoding=chinese

else

 set fileencoding=utf-8

endif

"解决菜单乱码

source $VIMRUNTIME/delmenu.vim

source $VIMRUNTIME/menu.vim

"解决consle输出乱码

language messages zh_CN.utf-8

"显示行号
set nu


"vundle配置"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
let path='$VIM/vimfiles/bundle' 
call vundle#rc(path)
Bundle 'gmarik/vundle'
" 以下为要安装或更新的插件，不同仓库都有（具体书写规范请参考帮助）
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
""界面设置
"""""""""""""""""""""""""""""""""""""""""""""
set number                                            "显示行号
set laststatus=2                                      "启用状态栏信息
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
" set guifont=YaHei_Consolas_Hybrid:h10                 "设置字体:字号（字体名称空格用下划线代替）
set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
" au GUIEnter * simalt ~x                           "窗口启动时自动最大化
winpos 100 10                                     "指定窗口出现的位置，坐标原点在屏幕左上角
set lines=38 columns=120                          "指定窗口大小，lines为高度，columns为宽度
colorscheme slate
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=

" -----------------------------------------------------------------------------
"  < 其它配置 >
" -----------------------------------------------------------------------------
set writebackup                             "保存文件前建立备份，保存成功后删除该备份
set nobackup                                "设置无备份文件
" set noswapfile                              "设置无临时文件
" set vb t_vb=                                "关闭提示音

