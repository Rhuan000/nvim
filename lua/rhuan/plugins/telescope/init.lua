return {
{
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local multi_open = function(prompt_bufnr)
        local picker = action_state.get_current_picker(prompt_bufnr)
        local selections = picker:get_multi_selection()

        if #selections > 0 then
          actions.close(prompt_bufnr)

          for _, entry in ipairs(selections) do
            vim.cmd("badd " .. vim.fn.fnameescape(entry.path))
          end

          vim.cmd("buffer " .. vim.fn.fnameescape(selections[#selections].path))
        else
          actions.select_default(prompt_bufnr)
        end
      end

      telescope.setup({
        defaults = {
          path_display = { "smart" },

          mappings = {
            i = {
              ["<CR>"] = multi_open,
            },
            n = {
              ["<CR>"] = multi_open,
            },
          },
        },

        extensions = {
          file_browser = {
            hijack_netrw = true,
            grouped = true,
            hidden = true,
            preview = false,
          },
        },
      })

      telescope.load_extension("file_browser")
    end,
  }
}
