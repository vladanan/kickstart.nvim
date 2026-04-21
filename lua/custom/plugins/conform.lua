-- go = { "gopls" },
-- java = { "jdtls" },
-- typescript = { "ts_ls" },
-- javascript = { "ts_ls" },
-- Those are LSP servers, not formatters.
-- 👉 conform.nvim expects formatters like:
-- goimports
-- gofmt
-- prettier
-- google-java-format
-- eslint_d
-- So later you may want:
-- go = { "goimports", "gofmt" },
-- java = { "google-java-format" },
-- typescript = { "prettier" },
-- javascript = { "prettier" },
-- od formatera sam odustao jer za sada mi izgleda ne trebaju

-- dakle ako za conform plugin zatrebaju formatteri mogu da se ubace u ovaj script dole

return {
  'stevearc/conform.nvim',
  config = function()
    local enabled_filetypes = {
      lua = true,
      go = true,
      java = true,
      javascript = true,
      typescript = true,
    }

    require('conform').setup {
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype

        if enabled_filetypes[ft] then return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        } end

        return nil
      end,
    }
  end,
}

