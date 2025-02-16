return {
  {
    "nvim-pack/nvim-spectre",
    opts = {
      find_engine = {
        ["rg"] = {
          cmd = "rg",
          args = {  -- исправлено: используется args вместо options
            "--vimgrep",
            "--hidden",   -- теперь будет искать в скрытых файлах
            "--no-ignore", -- игнорировать правила из .gitignore
            "--glob=!**/.git/*" -- исключить `.git` директорию
          }
        }
      }
    }
  },
}
