" Location:     autoload/run.vim

" Section:      functions 

function! run#Run(args = '')

    let command=&shell

    if !empty(a:args)
        let command=a:args
    endif

    execute g:run_runwin_cmd 'term://'command
    autocmd TermClose <buffer> bd
    normal a

endfunction

function! run#Compile(args = '')

    if empty(a:args)
        if !(exists('g:run_compiler_cmd') && !empty(g:run_compiler_cmd))
            echo 'No compiler command set'
            return
        endif
    else
        let g:run_compiler_cmd = a:args
    endif

    " kill an possibly already-running compilation
    for l:bufr in getbufinfo()
        if getbufvar(l:bufr.bufnr, '&filetype') == 'run-compiler'
            execute 'bdelete' l:bufr.bufnr
        endif
    endfor

    execute g:run_compilewin_cmd 'term://'g:run_compiler_cmd
    autocmd TermClose <buffer> call feedkeys("\<C-\>\<C-n>")
    set filetype=run-compiler
    normal a

endfunction
