"   .vimrc 
"
"   Contact: destruct.c{at}gmx{dot}net

syntax on                      " syntax on
colorscheme neverland2           " colorsheme

set t_Co=256
set notitle
set nocompatible               " no-vi compatible
set autoindent                 " autoindent
set autowrite                  " autowrite
set noerrorbells               " no noise
set laststatus=2               " statusline, always
set digraph                    " required for umlauts
set noexpandtab                " expandtab
set ef=error.err               " errorfile quickfixmode
set cmdheight=2                " numer of screen lines
set browsedir=last             " file browser directory
set makeef="~/tmp/vim##.err"   " errorfile ":make"
set scrolloff=2                " number of lines below cursor
set shortmess=atIT             " reduce length of message
set sidescrolloff=4            " min. nr. of columns left and right
set textwidth=72               " maximum width of text
set tabstop=8                  " tabstop
set autoread                   " autom. read file when changed outside of Vim
set hlsearch                   " higlight search
set incsearch                  " show partial matches
set listchars=tab:»·           " strings to use in 'list' mode
set list                       " show <Tab> and <EOL>
set updatecount=150            " write swapfile after n bytes
set updatetime=10000           " write swap file to disk after seconds
set display=lastline           " show as much as you can, and not @
set history=500                " make history longer
set shiftround                 " round indent to multiple of shiftwidth
set wildmenu                   " nice menu
"set wildmode=list:longest,full " completion 
set title                      " show title in term
set helpheight=20              " minimal height for :help
set softtabstop=8              " softtabstop
set showmatch                  " show matching brackets
set nowrap                     " dont wrap long lines
set writebackup                " writebackup
set backup                     " make backup
set showmode                   " show current mode
set ttyfast                    " fast terminal
set matchpairs=(:),[:],{:},<:> " pairs of characters that "%" can match
set nomodeline                 " no-modeline
set splitbelow                 " splitting window below
set tagrelative                " file names in tag file are relative
set showbreak=+                " string at the start of lines that have been wrapped
set backspace=2                " how backspace works at start of line
set dir=~/tmp,/tmp             " dir for swap files
set report=0                   " always report changes
set fileformat=unix            " fileformat

" Options initiating with 
set tag=./tags,tags,~/.vim/systags

" use .viminfo file upon startup and exiting
set vi=!,%,'5000,\"10000,:10000,/10000,n~/.viminfo

" specified keys that move the cursor left/right to wrap
set ww=<,>,h,l

" set backupdir
if !isdirectory(expand("~/tmp/.")) 
	!mkdir -p ~/tmp/
endif

set bdir=~/tmp

" statusline
set stl=%<[%n]\ %F\ \ Filetype=\%Y\ \ %r\ %1*%m%*%w%=%(Line:\ %l%)%4(%)Column:\ %5(%c%V/%{strlen(getline(line('.')))}%)\ %4(%)%p%%

" This option controls the behavior when switching between buffers.
set swb=useopen

" Paranoia ??? yes.. :)
" trust this current file, but no other
set secure

" horizontal splitt
map <F3>  :split<C-M>

" vertical splitt
map <F4>  :vnew<C-M>

" save
map <F5>  :w<C-M>

" save and end
map <F6>  :x<C-M>

" end without save
map <F7>  :q!<C-M>

" Tlist 
:nnoremap <silent> <F8> :Tlist<CR>

" Tagexlorer
:nnoremap <silent> <F9> :TagExplorer<CR> 

" paste toggle
set pt=<F10>

" list files in current directory.
map ,ls :!/bin/ls<CR>

" Change into directory of current file
nmap ,cd :exe 'cd ' . expand ("%:p:h")<CR>:pwd<CR>

" Options for Tlist
let TlistWinWidth = 10
let Tlist_Use_Right_Window = 1

" for minibufexplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplMinSize = 1
let g:miniBufExplMaxSize = 3

" Tagexplorer
let TE_Sort_Type = "name"
let TE_Include_File_Pattern = '.*\.c$\|.*\.h$\|.*\.pl$\|.*\.cpp$'
let TE_Use_Right_Window = 0 
let TE_WinWidth = 30 

" type of file, used for autocommands
filetype plugin on
filetype indent on

" settings for the c(++) 
"autocmd BufRead *.c set tw=0
augroup c
    autocmd!
    autocmd BufNewFile,BufRead *.c,*.h,*.cc,*.cpp so $VIMRUNTIME/syntax/c.vim
    autocmd BufNewFile,BufRead *.c,*.h,*.cc,*.cpp set com=sr:/*,mb:*,ex:*/ 
    autocmd BufRead,BufNewFile *.c,*.h,*.cc,*.cpp setlocal cindent
    autocmd BufRead,BufNewFile *.c,*.h,*.cc,*.cpp setlocal cinoptions=>4,e0,n0,f0,{0,}0,^0,:4,=4,p4,t4,c3,+4,(2s,u1s,)20,*30,g4,h4
    autocmd BufRead,BufNewFile *.c,*.h,*.cc,*.cpp setlocal cinkeys=0{,0},:,0#,!<C-F>,o,O,e
    "autocmd BufNewFile *.c call CInsert()
    autocmd BufWritePre,FileWritePre *.c  exec("normal ms")|call LastMod()|exec("normal `s")
    ab #d #define
    ab #i #include
    augroup END



" settings for perl
au FileType perl set cink=0{,0},!,o,O
                \ | set cinw=if,else,elsif,while,do,foreach,switch,sub
                \ | set com=b:#
                \ | set kp=perldoc\ -f
                \ | set smartindent
                \ | set errorformat=%f:%l:%m
augroup pl 
  autocmd!
  autocmd BufNewFile,BufRead *.pl,*.pm let perl_want_scope_in_variables=1
  autocmd BufNewFile,BufRead *.pl,*.pm let perl_extended_vars=1
  autocmd BufNewFile,BufRead *.pl,*.pm so $VIMRUNTIME/syntax/perl.vim
  autocmd BufNewFile,BufRead *.pl,*.pm set tw=0 nowrap 
" autocmd BufNewFile,BufRead *.pl,*.pm compiler perl
  autocmd BufNewFile,BufRead *.pl,*.pm setf perl
  autocmd BufWritePre,FileWritePre *.pl,*.pm  exec("normal ms")|call LastMod()|exec("normal `s")
  autocmd BufWrite *.pl !chmod +x %
  augroup END

augroup py
  autocmd!
  autocmd BufNewFile,BufRead *.py,*.pyc let python_highlight_all = 1
  autocmd BufNewFile,BufRead *.py,*.pyc set sts=4 sw=4 et
  autocmd BufWrite *.py !chmod +x %   


"settings for Shell(scripts)
augroup sh
  autocmd!
  autocmd BufNewFile,BufRead  *.sh,*.zsh,*.csh,*.ksh  so $VIMRUNTIME/syntax/sh.vim
  autocmd BufNewFile,BufRead  *.sh,*.zsh,*.csh,*.ksh  set tw=0 nowrap
  autocmd BufNewFile          *.sh,*.zsh,*.csh,*.ksh  call SHInsert()
  autocmd BufWrite,FileWritePre *.sh,*.zsh,*.csh,*.ksh  exec("normal ms")|call LastMod()|exec("normal `s")
  autocmd BufWritePre,FileWritePre ~/.xinitrc,~/.zshrc  exec("normal ms")|call LastMod()|exec("normal `s")
  autocmd BufWrite            *.sh,*.zsh,*.ksh  !chmod +x %
  autocmd BufNewFile,BufRead  *.sh,*.zsh,*.csh,*.ksh  set com=sr:#,mb:#,ex:#/ cindent fo+=r
augroup END

" settings for vim Files
augroup vim
  autocmd!
  autocmd BufWritePre,FileWritePre *.vim exec("normal ms")|call LastMod()|exec("normal `s")
  autocmd BufNewFile,BufRead *.vim,*.vimrc set tw=180 nowrap ft=vim
  autocmd BufNewFile,BufRead *.vim,*.vimrc set com=sr:\",b:\",mb:* cindent fo+=r
  autocmd BufNewFile,BufRead *.vim,*.vimrc so $VIMRUNTIME/syntax/vim.vim
augroup END

" muttng setting
au BufNewFile,BufRead muttng-*-\w\+,muttng\w\{6\},ae\d setf mail

" settings for mail
augroup mail 
  autocmd! 
  autocmd FileType mail so $VIMRUNTIME/syntax/mail.vim
  autocmd FileType mail set textwidth=72 wrap nonumber noautoindent  
augroup END

" settings for html
augroup html
  autocmd!
  autocmd BufNewFile,BufRead *.html,*.shtml so $VIMRUNTIME/syntax/html.vim 
  autocmd BufNewFile,BufRead *.html,*.shtml set tw=0 nowrap
  autocmd BufNewFile *.html,*.shtml,*.htm call HTMLInsert()
  autocmd BufWritePre,FileWritePre *.html,*.shtml exec("normal ms")|call LastMod()|exec("normal `s")
augroup END

" settings for css
augroup css
  autocmd!
  autocmd BufNewFile,BufRead *.css so $VIMRUNTIME/syntax/css.vim
  autocmd BufNewFile,BufRead *.css set tw=0 nowrap
  autocmd BufNewFile         *.css call CSSInsert()
  autocmd BufWritePre,FileWritePre *.css exec("normal ms")|call LastMod()|exec("normal `s")
augroup END

" For the lastmod augroup 
function! LastMod()
        if line("$") > 1000
                let l = 1000
        else    
                let l = line("$")
        endif   
        exe "1," . l . "s/Last modified: .*/Last modified: " .  strftime("( %Y-%m-%d %T )") . "/e"
endfunction  

" Removes those bloody ^M's
" :call RmCR()
fun RmCR()
    let oldLine=line('.')
    exe ":%s/\r//gic"
    exe ':' . oldLine
endfun

