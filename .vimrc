" vi互換動作off
set nocompatible

" --------------------------------------------------
" dein configuration
" --------------------------------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
  call dein#add('leafgarland/typescript-vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" --------------------------------------------------
" 基本機能
" --------------------------------------------------

" インサートモードでスペースや改行を削除できるように
set backspace=indent,eol,start
" 矩形選択時、空文字の部分を選択できるようにする
set virtualedit=block
" 自動インデント
set autoindent
set smartindent
" tabでスペースを挿入
set expandtab
" インデントの幅
set shiftwidth=4
" タブの幅
set tabstop=4
"日本語対応
set encoding=utf-8
" 対応文字コード
set fileencodings=utf-8,iso-2022-jp,enc-jp,cp932
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" 保管表示
set wildmenu wildmode=list:full

" --------------------------------------------------
" 検索設定
" --------------------------------------------------

" 大文字小文字を区別しない
set ignorecase
" 検索キーワードに大文字を含む場合は大文字小文字を区別する
set smartcase
" ファイル末尾まで検索したら先頭から再検索
set wrapscan
" インクリメンタルサーチを利用
set incsearch
" 検索結果をハイライト
set hlsearch

" --------------------------------------------------
" 表示設定
" --------------------------------------------------

" 行番号を表示
set number
" シンタックスハイライトを有効化
syntax on
" 256色表示対応
set t_Co=256
" タイトルを表示
set title
" 現在行を強調表示
set cursorline
" 全角:半角の比率を2:1に
set ambiwidth=double
" 現在のカッコに対応するカッコの強調表示
set showmatch
" カッコの強調表示時に一時的にカーソルを移動させる時間 (0.1s * n)
set matchtime=1
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
"ステータスラインを表示
set laststatus=2
"ステータスラインに表示する情報
set statusline=%F%r%n%=

" --------------------------------------------------
" その他設定
" --------------------------------------------------

" カーソルが画面の端から3行目でスクロール
set scrolloff=3
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" コマンドラインの履歴を保存
set history=10000
" 各種バックアップファイルを無効化
set nowritebackup
set nobackup
set noswapfile

" --------------------------------------------------
" キーバインド設定 
" --------------------------------------------------

" escを2回押してハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" --------------------------------------------------
" color scheme
" --------------------------------------------------

"カラースキーム
colorscheme jellybeans

" --------------------------------------------------
" configuration for coc.nvim
" --------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" --------------------------------------------------
" filetype configuration
" --------------------------------------------------

autocmd BufRead,BufNewFile *.tsx setfiletype typescript.tsx

