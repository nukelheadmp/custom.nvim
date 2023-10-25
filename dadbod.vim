xnoremap <expr> <Plug>(DBExe)     db#op_exec()
nnoremap <expr> <Plug>(DBExe)     db#op_exec()
nnoremap <expr> <Plug>(DBExeLine) db#op_exec() . '_'

xmap <leader>db  <Plug>(DBExe)
nnoremap <leader>db  <Plug>(DBExe)
omap <leader>db  <Plug>(DBExe)
nnoremap <leader>dbb <Plug>(DBExeLine)

source ~/.config/nvim/dadbods.vim
