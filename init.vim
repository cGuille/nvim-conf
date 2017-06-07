call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'jaywilliams/vim-vwilight'
Plug 'rust-lang/rust.vim'
Plug 'gabrielelana/vim-markdown'
call plug#end()

syntax on
set background=dark
colorscheme vwilight
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let base16colorspace=256

" from: http://nerditya.com/code/guide-to-neovim/
" Map the leader key to SPACE
let mapleader="\<SPACE>"

set spelllang=fr,en     " Enable these languages for spell check.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.

"set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=8       " Show next n lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=10   " Show next n columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>
" endfrom: http://nerditya.com/code/guide-to-neovim/

nmap h<Up> <Plug>GitGutterPrevHunk
nmap h<Down> <Plug>GitGutterNextHunk

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \<SPACE>l                     : list buffers
" \<SPACE>b \<SPACE>f \<SPACE>g : go back/forward/last-used
" \<SPACE>1 \<SPACE>2 \<SPACE>3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

nnoremap <Leader>n :NERDTreeToggle<CR>

