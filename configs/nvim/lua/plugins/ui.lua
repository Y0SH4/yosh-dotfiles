---@diagnostic disable: undefined-global
---@type table
vim = vim
return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
▀█████████▄     ▄████████ ███▄▄▄▄      ▄██████▄       ▄██   ▄    ▄██████▄     ▄████████    ▄█    █▄    
  ███    ███   ███    ███ ███▀▀▀██▄   ███    ███      ███   ██▄ ███    ███   ███    ███   ███    ███   
  ███    ███   ███    ███ ███   ███   ███    █▀       ███▄▄▄███ ███    ███   ███    █▀    ███    ███   
 ▄███▄▄▄██▀    ███    ███ ███   ███  ▄███             ▀▀▀▀▀▀███ ███    ███   ███         ▄███▄▄▄▄███▄▄ 
▀▀███▀▀▀██▄  ▀███████████ ███   ███ ▀▀███ ████▄       ▄██   ███ ███    ███ ▀███████████ ▀▀███▀▀▀▀███▀  
  ███    ██▄   ███    ███ ███   ███   ███    ███      ██   ███ ███    ███          ███   ███    ███   
  ███    ███   ███    ███ ███   ███   ███    ███      ███   ███ ███    ███    ▄█    ███   ███    ███   
▄█████████▀    ███    █▀   ▀█   █▀    ████████▀        ▀█████▀   ▀██████▀   ▄████████▀    ███    █▀    
                                                                                                       
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      return {
        header = vim.split(logo, "\n")
      }
    end,
  },
}
