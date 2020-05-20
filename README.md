# vim-sling
Sling.nvim is a plugin for Neovim that allows you to setup run configurations and execute in a Neovim terminal.

## Installation
Using [vim-plug](https://github.com/junegunn/vim-plug):

Add to your `init.vim`

```vim
Plug 'Sn00pbom/vim-sling'
```

Then restart and run `:PlugInstall`.

## Example Configuration
You can bind Sling to your key combo of choice like so

```vim
" Default Sling path is ./sling.sh
noremap <F5> :Sling<CR>
```

You can set a default path name

```vim
let g:sling#sling_path = "gnils.sh"
noremap <F5> :Sling<CR>
```

You can also set an absolute path as default!

```vim
let g:sling#sling_path = "~/my_folder/gnils.sh"
noremap <F5> :Sling<CR>
```

Or you can bind multiple sling files by calling directly

```vim
noremap <F5> call Sling("sling1.sh")<CR>
noremap <F6> call Sling("sling2.sh")<CR>
```
