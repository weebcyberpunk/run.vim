" Title:        run.vim
" Description:  Automate compiling and running for Vim
" Last Change:  11 July 2022
" Mainteiner:   GG https://github.com/weebcyberpunk
" Location:     plugin/run.vim

if exists('g:autoloaded_run')
    finish
endif

let g:autoloaded_run = 1

" Section:      config

if !exists('g:run_runwin_cmd')
    let g:run_runwin_cmd='split'
endif
if !exists('g:run_compilewin_cmd')
    let g:run_compilewin_cmd='split' " split vsplit tabnew
endif

" Section:      commands

command! -complete=shellcmd -nargs=* Run call run#Run(<q-args>)
command! -complete=shellcmd -nargs=* Compile call run#Compile(<q-args>)
