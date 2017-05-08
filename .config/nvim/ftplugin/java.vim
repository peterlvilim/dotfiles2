nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>I :JavaImportOrganize<cr>
nnoremap <leader>c :JavaCorrect<cr>
nnoremap <leader>r :JavaRename<cr>
nnoremap <leader>v :Validate<cr>
nnoremap <leader>C :JavaCallHierarchy<cr>
nnoremap <leader>d :JavaSearch -t all -x declerations<cr>
nnoremap <leader>D :JavaSearch -t all -x implementors<cr>
nnoremap <leader>p :JavaDocPreview<cr>
nnoremap <leader>b :ProjectProblems<cr>
noremap  <leader>o <C-w>z :ccl<cr>
noremap  <leader>f :%JavaFormat<cr>

let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)
