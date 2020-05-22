
function! Sling(path)
    if filereadable(a:path)
	let l:lines = readfile(a:path)
    else
	echo "Missing sling file @ " . a:path
	if g:sling#edit_on_missing
	    execute "edit " . a:path
	endif
	return
    endif
    " terminal
    vsplit term://$SHELL
    startinsert
    let job_id = b:terminal_job_id
    echo "Slinging " . a:path . "!"
    for l:line in l:lines
	if l:line !~ "^#" " line does not start with #
	    call jobsend(job_id, l:line)
	    call jobsend(job_id, "\n")
	endif
    endfor
endfunction

com! Sling call Sling(g:sling#sling_path)
