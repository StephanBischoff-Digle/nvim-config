local on_attach = function(client, bufnr)
    -- enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- mappings
    local opts = { noremap=true, silent=true }

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    buf_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    buf_set_keymap('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)

    -- if client.resolved_capabilities.document_formatting then
        buf_set_keymap('n', '<leader>fb', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
    -- elseif client.resolved_capabilities.document_range_formatting then
        -- buf_set_keymap('n', '<leader>fb', '<cmd>lua vim.lsp.buf.range_formatting()<cr>', opts)
    -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconf = require'lspconfig'
lspconf.rust_analyzer.setup{ on_attach = on_attach }
lspconf.clangd.setup {
    on_attach = on_attach,

    cmd = {
        'clangd',
        '--background-index',
        '--suggest-missing-includes',
        '--clang-tidy',
    },
    filetype = {"c", "cpp"}
}
lspconf.cmake.setup{ on_attach = on_attach }
lspconf.pyright.setup{ on_attach = on_attach }
lspconf.texlab.setup{ on_attach = on_attach }
lspconf.phpactor.setup{ on_attach = on_attach }
lspconf.tsserver.setup{ on_attach = on_attach }

local lua_lsp = "/usr/bin/lua-language-server"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconf.sumneko_lua.setup {
    cmd = { lua_lsp, "-E", "/usr/share/lua-language-lserver/main.lua" };
    settings = {
        Lua = {
            runtime = { path = runtime_path },
            version = 'LuaJIT',
            diagnostics = { globals = {'vim', 'use'} },
            workspace= { library = vim.api.nvim_get_runtime_file("", true) }
        }
    }
}


-- Enable diagnostics
-- replace the default lsp diagnostic symbols
function lspSymbol(name, icon)
   vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefault" .. name })
end

lspSymbol("Error", "???")
lspSymbol("Warning", "???")
lspSymbol("Information", "???")
lspSymbol("Hint", "???")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
   virtual_text = {
      prefix = "???",
      spacing = 5,
   },
   signs = true,
   underline = true,
   -- set this to true if you want diagnostics to show in insert mode
   update_in_insert = true,
})

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
   if msg:match "exit code" then
      return
   end
   if log_level == vim.log.levels.ERROR then
      vim.api.nvim_err_writeln(msg)
   else
      vim.api.nvim_echo({ { msg } }, true, {})
   end
end

vim.api.nvim_exec([[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' ?? ', highlight = "Comment", enabled = {"ChainingHint"} }]], false)
