return {
  "akinsho/nvim-bufferline.lua",
  lazy = false,
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "both",
        close_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not set
          style = "icon",
        },
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
          if buf.name:match("%.md") then
            return vim.fn.fnamemodify(buf.name, ":t:r")
          end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is deduplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        diagnostics_update_in_insert = false,
        offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "slant",  -- can also be 'thick' or 'thin'
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "id",
      },
    })
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {})
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {})
  end,
}
