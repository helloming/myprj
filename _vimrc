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
"vim7.1��windows�µı������á�
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8

set fileencodings=utf-8,chinese,latin-1

if has("win32")

 set fileencoding=chinese

else

 set fileencoding=utf-8

endif

"����˵�����

source $VIMRUNTIME/delmenu.vim

source $VIMRUNTIME/menu.vim

"���consle�������

language messages zh_CN.utf-8

"��ʾ�к�
set nu


"vundle����"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
let path='$VIM/vimfiles/bundle' 
call vundle#rc(path)
Bundle 'gmarik/vundle'
" ����ΪҪ��װ����µĲ������ͬ�ֿⶼ�У�������д�淶��ο�������
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
""��������
"""""""""""""""""""""""""""""""""""""""""""""
set number                                            "��ʾ�к�
set laststatus=2                                      "����״̬����Ϣ
set cmdheight=2                                       "���������еĸ߶�Ϊ2��Ĭ��Ϊ1
set cursorline                                        "ͻ����ʾ��ǰ��
set nowrap                                            "���ò��Զ�����
set shortmess=atI                                     "ȥ����ӭ����
" au GUIEnter * simalt ~x                           "��������ʱ�Զ����
winpos 100 10                                     "ָ�����ڳ��ֵ�λ�ã�����ԭ������Ļ���Ͻ�
set lines=38 columns=120                          "ָ�����ڴ�С��linesΪ�߶ȣ�columnsΪ���
colorscheme slate
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=
syntax enable
syntax on

"ָ����ɫ����Ϊ
colorscheme Tomorrow-Night-Eighties

"��������ʱ���Դ�Сд
set ignorecase
" -----------------------------------------------------------------------------
"  < �������� >
" -----------------------------------------------------------------------------
set writebackup                             "�����ļ�ǰ�������ݣ�����ɹ���ɾ���ñ���
set nobackup                                "�����ޱ����ļ�
set noswapfile                              "��������ʱ�ļ�
set vb t_vb=                                "�ر���ʾ��
set guifont=Courier_New:h12:cANSI   " ��������  
set ruler           " ��ʾ���  
set showcmd         " �����������ʾ�������������Щ  
set cmdheight=1     " �����У���״̬���£��ĸ߶ȣ�����Ϊ1  
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
highlight Comment ctermfg=green guifg=green
"--------------------------ctags----------
set tags=tags; 
set autochdir
"--------------------------Tlist--------------
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
"-------------------------- ����winmanager
" ���ý���ָ�
let g:winManagerWindowLayout = "TagList|FileExplorer"
"����winmanager�Ŀ�ȣ�Ĭ��Ϊ25
let g:winManagerWidth = 30
"����򿪹ر�winmanager��ݼ�ΪF8
nmap <silent> <F8> :WMToggle<cr>
"�ڽ���vimʱ�Զ���winmanager
let g:AutoOpenWinManager = 1
