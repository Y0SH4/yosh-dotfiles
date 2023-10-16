local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
 return
end

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
indent_blankline.setup()
