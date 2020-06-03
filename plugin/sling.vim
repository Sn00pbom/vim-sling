
function! Sling(path)
    if filereadable(a:path)
	let l:lines = readfile(a:path)
	if len(l:lines) == 0 " Sling file is empty
	    echo 'Empty Sling!'
	    return
	endif
    else
	echo "Missing sling file @ " . a:path
	if g:sling#edit_on_missing
	    execute "edit " . a:path
	endif
	return
    endif

    echo "Slinging " . a:path . "!"

    if l:lines[0] =~ "^#!" "File starts with shebang
	call SlingShell(a:path)
    else
	call SlingTerminal(l:lines)
    endif
endfunction

function! SlingShell(path)
    silent execute "!chmod +x " . a:path
    execute "!" . a:path
endfunction

function! SlingTerminal(lines)
    let l:lines = a:lines
    if has('nvim')
	vsplit term://$SHELL
	startinsert
	let l:job_id = b:terminal_job_id
	for l:line in l:lines
	    if l:line !~ "^#" " line does not start with #
		call jobsend(l:job_id, l:line)
		call jobsend(l:job_id, "\n")
	    endif
	endfor
    else
	execute "terminal"
	let l:job_id = bufnr('%') " get current buffer number
	for l:line in l:lines
	    if l:line !~ "^#" " line does not start with #
		call term_sendkeys(l:job_id, l:line)
		call term_sendkeys(l:job_id, "\n")
	    endif
	endfor
    endif
endfunction

com! Sling call Sling(g:sling#sling_path)
