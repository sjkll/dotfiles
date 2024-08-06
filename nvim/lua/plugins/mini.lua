return {
  {
    "echasnovski/mini.surround",
    version = false,
    keys = { "sa", "sd", "sr" },
    opts = {
      highlight_duration = 2000, -- 2s
      mappings = {
        add = "sa", -- Add surroundng in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        replace = "sr", -- Replace surrounding
      },
    },
  },
}
