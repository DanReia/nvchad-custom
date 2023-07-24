local M = {}

M.disabled = {
  n = {
      ["<leader>wk"] = "",
      ["<leader>wK"] = "",
  }
}

-- Your custom mappings
M.general = {
  n={
        ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
        ["H"] = { "^", "Go to beginning of line" },
        ["L"] = { "$", "Go to end of line" },
        ["<leader><leader>"]={"<C-^>","Go to previous buffer"}

    },
  i = {
     ["jj"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },
    v={
        ["H"] = { "^", "Go to beginning of line" },
        ["L"] = { "$", "Go to end of line" },
    },
    t={
        ["jj"]={[[<C-\><C-n>]],"Exit terminal"},
        ["<C-h>"]={[[<Cmd>wincmd h<CR>]],"Move"},
        ["<C-j>"]={[[<Cmd>wincmd j<CR>]],"Move"},
        ["<C-k>"]={[[<Cmd>wincmd k<CR>]],"Move"},
        ["<C-l>"]={[[<Cmd>wincmd l<CR>]],"Move"},
    },
    o={
        ["H"] = { "^", "Go to beginning of line" },
        ["L"] = { "$", "Go to end of line" },
    },

}

M.dap={
    plugin = true,
    n={
        ["<leader>db"]={
            "<cmd> DapToggleBreakpoint <CR>",
            "Toggle Breakpoint"
        },
        ["<leader>dc"]={
            "<cmd> DapToggleContinue <CR>",
            "Dap Continue"
        },
        ["<leader>dus"]={
            function()
                local widgets=require('dap.ui.widgets');
                local sidebar=widgets.sidebar(widgets.scopes);
                sidebar.open();
            end,
            "Open debugging sidebar"
        }
    }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}




return M

