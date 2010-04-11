" Vim filetype plugin file
" Language:	lzx
" Maintainer:	Sarah Allen <sarah at ultrasaurus dot com>
" Last Changed: 2009 Jan 1
" URL:		http://www.ultrasaurus.com/code/
" based on code by Dan Sharp for loading xml plugin from xsd.vim 
"               by Adam Wolff for lzx language shortcuts

if exists("b:did_ftplugin") | finish | endif

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
let s:save_cpo = &cpo
set cpo-=C

" Define some defaults in case the included ftplugins don't set them.
let s:undo_ftplugin = ""
let s:browsefilter = "XML Files (*.xml)\t*.xml\n" .
	    \	     "All Files (*.*)\t*.*\n"

runtime! ftplugin/xml.vim ftplugin/xml_*.vim ftplugin/xml/*.vim
let b:did_ftplugin = 1

" Override our defaults if these were set by an included ftplugin.
if exists("b:undo_ftplugin")
    let s:undo_ftplugin = b:undo_ftplugin
endif
if exists("b:browsefilter")
    let s:browsefilter = b:browsefilter
endif

" Change the :browse e filter to primarily show lzx-related files.
if has("gui_win32")
    let  b:browsefilter="LZX Files (*.lzx)\t*.lzx\n" . s:browsefilter
endif

" LZX shortcuts
function! Eatchar(pat)
    let c = nr2char(getchar())
    return (c =~ a:pat) ? '' : c
endfun

augroup lzxfile
autocmd!
autocmd BufEnter * iabbr Deb Debug.write( 
au BufEnter * iabbr Deb Debug.write(
au BufEnter * iabbr imm immediateparent
au BufEnter * iabbr attr <attribute name="<C-R>=Eatchar('\s')<CR>
au BufEnter * iabbr inc <include href="<C-R>=Eatchar('\s')<CR>
au BufEnter * iabbr inc <include href="<C-R>=Eatchar('\s')<CR>
au BufEnter * iabbr lib <library>>
au BufEnter * iabbr can <canvas>>
" note: lib and can depend on xmledit plugin http://www.vim.org/scripts/script.php?script_id=301
" if that plugin is not installed, the following lines can be used instead
"au BufEnter * iabbr lib <library><CR><CR></library><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><C-R>=Eatchar('\s')<CR> 
"au BufEnter * iabbr   can <canvas><CR><CR></canvas><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><C-R>=Eatchar('\s')<CR> 
au BufEnter * iabbr meth <method name="<C-R>=Eatchar('\s')<CR>
au BufEnter * iabbr sett <setter name="<C-R>=Eatchar('\s')<CR>
au BufEnter * iabbr hand <handler name="<C-R>=Eatchar('\s')<CR>
au BufEnter * iabbr sim <simplelayout/><C-R>=Eatchar('\s')<CR>
au BufEnter * iabbr cdat <![CDATA[ ]]><Left><Left><Left>

" Laszlo Webtop shortcuts 
" (also LZX but tag is defined in Laszlo Webtop product)
au BufEnter * iabbr app <application name="<C-R>=Eatchar('\s')<CR>

augroup END

" other LZX file preferences
let g:xml_syntax_folding = 1
setlocal foldmethod=syntax
setlocal smartindent
if &tw == 0
  setlocal tw=78
endi

let b:undo_ftplugin = "unlet! b:browsefilter | " . s:undo_ftplugin

" Restore the saved compatibility options.
let &cpo = s:save_cpo

