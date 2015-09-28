command! -range=% Rst :'<,'>!pandoc -f markdown -t rst
nnoremap <Leader>tf :Rst<CR>
