let g:sling#sling_path = "sling.sh"

function! Sling(path)
    if filereadable(a:path)
	let l:lines = readfile(a:path)
    else
	echo "No " + a:path + " in directory!"
	return
    endif
    terminal
    startinsert
    let job_id = b:terminal_job_id
    echo "Slinging " + a:path + "!"
    for l:line in l:lines
	if l:line !~ "^#" " line does not start with #
	    call jobsend(job_id, l:line)
	    call jobsend(job_id, "\n")
	endif
    endfor
endfunction

com! Sling call Sling(g:sling#sling_path)
