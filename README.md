# sling.vim
Sling is a snappy run configuration launcher for Vim 8.1+ and Neovim!

The script reads a text file line by line and sends the inputs to a spawned terminal in Vim.

## Installation
- Using [vim-pathogen](https://github.com/tpope/vim-pathogen)

run `git clone https://github.com/Sn00pbom/vim-sling ~/.vim/bundle/vim-sling`

- Using [vim-plug](https://github.com/junegunn/vim-plug):

Add to your `init.vim`

```vim
Plug 'Sn00pbom/vim-sling'
```

Then restart and run `:PlugInstall`.

## Example Configuration
You can bind Sling to your key combo of choice like so

```vim
" Default Sling path is ./.sling
nnoremap <F5> :Sling<CR>
```

You can set a default path name if you like

```vim
let g:sling#sling_path = ".gnils"
nnoremap <F5> :Sling<CR>
```

You can also set an absolute path as default!

```vim
let g:sling#sling_path = "~/my_folder/.sling"
nnoremap <F5> :Sling<CR>
```

Or you can bind multiple sling files by calling directly

```vim
nnoremap <F5> call Sling(".sling1")<CR>
nnoremap <F6> call Sling(".sling2")<CR>
```

By default, if a sling file is missing, a buffer will open to edit it. This behavior can be changed with the following

```vim
let g:sling#edit_on_missing = 0
```
