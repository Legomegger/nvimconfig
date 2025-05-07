---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")

    -- Добавим prettier как форматтер, но только если есть package.json
    local prettier = null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",   -- для .jsx
        "typescript",
        "typescriptreact",   -- для .tsx
      },
      -- чтобы prettier понимал, какой парсер выбирать по расширению
      extra_args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
      -- если хочешь, чтобы всегда использовался локальный из node_modules
      prefer_local = "node_modules/.bin",
      -- и не вешать в чужих папках без package.json
      condition = function(utils)
        return utils.root_has_file({
          "package.json",
          ".prettierrc",
          "prettier.config.js",
        })
      end,
    })

    -- Вставляем, не ломая старые источники
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      prettier,
    })
  end,
}

