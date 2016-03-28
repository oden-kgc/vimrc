" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

set nocompatible

" NeoBundle Initialize START
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	" call neobundle#rc(expand('~/.vim/bundle/'))
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Neobundle Initialize END

NeoBundleFetch 'Shougo/neobundle.vim'

" 
" plugins
"
NeoBundle 'vim-scripts/Colour-Sampler-Pack'
NeoBundle 'apribase/ap_dark8'
NeoBundle 'itchyny/landscape.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler', { 'depends' : ["Shougo/unite.vim"] }
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'scrooloose/snipmate-snippets'
NeoBundle 'ujihisa/unite-colorscheme'

" 
NeoBundle 'vim-jp/cpp-vim'

NeoBundle 'ruby.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'tpope/vim-haml'
NeoBundle 'skwp/vim-rspec'

" NeoBundle 'JavaScript-syntax'
" NeoBundle 'taichouchou2/vim-javascript'

NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'vim-scripts/jQuery'
NeoBundle 'jelera/vim-javascript-syntax'
" NeoBundle 'honza/snipmate-snippets'
NeoBundle 'bonsaiben/bootstrap-snippets'

NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'

NeoBundle 'Shougo/vinarise'
NeoBundle 's-yukikaze/vinarise-plugin-peanalysis'

NeoBundle 'kchmck/vim-coffee-script'

call neobundle#end()

syntax on
filetype plugin indent on

NeoBundleCheck

"" Encode
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

"" File
set hidden		" ファイル変更中でも他のファイルを開けるようにする
set autoread	" ファイル内容が変更されると自動読み込みする

"" Backup
set backup
set backupdir=~/tmp
set directory=~/tmp
set history=1000

"" Search
set incsearch		" Incremental search
set hlsearch
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching

"" Input
set cindent
set autoindent
set smartindent
set tabstop=4
set sw=4
set softtabstop=4
set backspace=indent,eol,start


set cinoptions=:0
set nrformats-=octal
set nrformats+=alpha
set nrformats+=hex

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" colorscheme desert

hi Statement ctermfg=green term=bold
hi Function ctermfg=lightblue term=bold
hi Identifier ctermfg=lightblue

if exists('&ambiwidth')
	set ambiwidth=double
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.

set laststatus=2
set nowrap
set wildmenu

" colorscheme solarized
" set background=light

au BufNewFile,BufRead Schemafile :set filetype=ruby

"" Filetype
autocmd FileType ruby,yaml,yml,haml,sass,scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" neocompcache
set completeopt=menuone
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1

let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '', 
	\ 'vimshell' : $HOME.'/.vimshell_hist', 
	\ 'scheme' : $HOME.'/.gosh_completions'
	\ }

if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>	neocomplcache#undo_completion()
inoremap <expr><C-l>	neocomplcache#complete_common_string()

inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() :  "\<CR>"
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<UP>" : "\<S-TAB>"
inoremap <expr><C-y>	neocomplcache#close_popup()
inoremap <expr><C-e>	neocomplcache#cancel_popup()

" inoremap <expr><Space>	pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"

" set completeopt+=longest
" let g:neocomplcache_enable_auto_select = 1
" let g:neocomplcache_disable_auto_complete = 1
" inoremap <expr><TAB>	pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets, ~/dotfiles/snippets,  ~/.vim/bundle/snipmate-snippets-rubymotion/snippets'
imap <C-k>		<Plug>(neosnippet_expand_or_jump)
smap <C-k>		<Plug>(neosnippet_expand_or_jump)

imap <expr><TAB>	neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB>	neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
	set conceallevel=2 concealcursor=i
endif

set pastetoggle=<F11>
set helplang=ja

" Syntax file for jQuery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


