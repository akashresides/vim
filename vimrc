source $VIMRUNTIME/defaults.vim
let g:mapleader=" "
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:skip_defaults_vim=1
set complete^=o
set cmdheight=2
set laststatus=2
set fillchars+=eob:·
set foldmethod=indent
set wildoptions=pum,fuzzy
set wildmode^=noselect:lastused
set completeopt+=fuzzy,popup
set rnu cul tgc ac nosmd hls ic scs spr sb cf

colorscheme catppuccin_mocha
hi Normal guibg=NONE

autocmd CmdlineChanged [:/?] if getcmdline() =~# '!' | else | call wildtrigger() | endif
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <*S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
noremap W <C-W>

runtime ftplugin/man.vim
packadd comment
packadd nohlsearch
packadd helpcurwin
packadd helptoc
packadd matchit
packadd termdebug
packadd vimbits
packadd devdocs
nnoremap <leader>d :DevdocsFind<CR>

packadd lsp
call LspOptionsSet(#{
        \   autoComplete: v:false,
        \   autoHighlightDiags: v:true,
        \   autoPopulateDiags: v:true,
        \   showDiagInPopup: v:true,
        \   showDiagOnStatusLine: v:true,
        \   showDiagWithSign: v:true,
        \   showDiagWithVirtualText: v:true,
        \   showSignature: v:true,
        \   showInlayHints: v:true,
	\   semanticHighlight: v:true	
	\ })
" call LspAddServer([#{
" 	\    name: 'clangd',
" 	\    filetype: ['c', 'cpp'],
" 	\    path: '/usr/bin/clangd',
" 	\    args: ['--background-index', '--clang-tidy']
" 	\  }])
call LspAddServer([#{
	\    name: 'golang',
	\    filetype: ['go', 'gomod'],
	\    path: '/usr/bin/gopls',
	\    args: ['serve'],
	\    syncInit: v:true,
	\    workspaceConfig: #{
	\     gopls: #{
	\       hints: #{
	\         assignVariableTypes: v:true,
	\         compositeLiteralFields: v:true,
	\         compositeLiteralTypes: v:true,
	\         constantValues: v:true,
	\         functionTypeParameters: v:true,
	\         parameterNames: v:true,
	\         rangeVariableTypes: v:true
	\       }
	\     }
	\   }
	\  }])
call LspAddServer([#{
	\   name: 'ty',
	\   filetype: 'python',
	\   path: '/usr/bin/ty',
	\   args: ['server']
	\ }])
