return {
  {
    "echasnovski/mini.move",
    keys = {
      { "<A-left>", mode = "n", desc = "Movelineleft" },
      { "<A-down>", mode = "n", desc = "Movelinedown" },
      { "<A-up>", mode = "n", desc = "Movelineup" },
      { "<A-right>", mode = "n", desc = "Movelineright" },
      { "<A-left>", mode = "v", desc = "Moveselectionleft" },
      { "<A-down>", mode = "v", desc = "Moveselectiondown" },
      { "<A-up>", mode = "v", desc = "Moveselectionup" },
      { "<A-right>", mode = "v", desc = "Moveselectionright" },
    },
    opts = {
      mappings = {
        left = "<A-left>",
        down = "<A-down>",
        up = "<A-up>",
        right = "<A-right>",
        line_left = "<A-left>",
        line_down = "<A-down>",
        line_up = "<A-up>",
        line_right = "<A-right>",
      },
      reindent_linewise = true,
    },
  },
  {
    "echasnovski/mini.surround",
    keys = {
      { "sa", desc = "AddSurrounding" },
      { "sd", desc = "DeleteSurrounding" },
      { "sf", desc = "FindSurroundingRight" },
      { "sF", desc = "FindSurroundingLeft" },
      { "sv", desc = "HighlightSurrounding" },
      { "sr", desc = "ReplaceSurrounding" },
      { "sn", desc = "UpdateNLines" },
    },
    opts = {
      mappings = {
        add = "sa", --AddsurroundinainNormalandVisualmodes
        delete = "sd", --Deletesurrounding
        find = "sf", --Findsurrounding(totheright)
        find_left = "sF", --Findsurrounding(totheleft)
        highlight = "sv", --Highlightsurrounding
        replace = "sr", --Replacesurrounding
        update_n_lines = "sn", --Update`n_lines`

        suffix_last = "l", --Suffixtosearchwith"prev"method
        suffix_next = "n", --Suffixtosearchwith"next"method
      },
    },
  },
  {
    "echasnovski/mini.ai",
    event = "User AstroFile",
    opts = {},
  },
  {
    "catppuccin/nvim",
    optional = true,
    opts = { integrations = { mini = true } },
  },
}
