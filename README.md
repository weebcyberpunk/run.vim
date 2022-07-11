# run.vim

Simple compiling and testing automation for Vim and Neovim.

# Install

Use your favorite Vim or Neovim package manager.

# Usage

The plugin defines two commands: `Run` and `Compile`.

## Run

`Run` will start a process on the `:terminal`, but will automatically enter
terminal mode and close the window when the process ends. You may use args to
define a process (for example, `Run python` will start a Python repl), and, if
called without args, it will default to the `shell` Vim variable.

## Compile

`Compile` will also start a process on `:terminal`, but it'll leave the buffer
opened when finished.

The main difference it's that when calling `Compile` with args, it'll set the
variable `g:run_compile_cmd` to them, and if calling it without args, it'll run
whatever is in that variable.

This way, you can set the compiling command only once within a session. After
that, you can simply use `:Compile` to run the same command again.

## Settings

To specify a default compiling command, simply set `g:run_compile_cmd` to
whatever you want on your Vim or Neovim config file.

You can also use `g:run_runwin_cmd` and `g:run_compilewin_cmd` to specify the
Vim command to open the terminal window for each command of run.vim: either
`split` (the default for both), `vsplit` or `tabnew`.
