-- https://github.com/ahmedkhalf/project.nvim
-- 输出保存目录
-- :lua print(require("project_nvim.utils.path").historyfile)
-- 我的文件在
--  ~/.local/share/nvim/project_nvim/project_history

local status, project = pcall(require, "project_nvim")
if not status then
  vim.notify("没有找到 project_nvim")
  return
end

vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
  detection_methods = { "lsp", "pattern" },
  patterns = {
    "Cargo.toml",
    "package.json",
    ".sln",
    ".git",
    "README.md",
    "_darcs",
    ".hg",
    ".bzr",
    ".svn",
    "Makefile",
    "CmakeList.txt",
  },
})

local status_telescope, telescope = pcall(require, "telescope")
if not status_telescope then
  vim.notify("没有找到 telescope")
  return
end
pcall(telescope.load_extension, "projects")
