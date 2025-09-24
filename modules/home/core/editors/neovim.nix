{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim;
    vimAlias = true;

    opts = {
      winborder = "rounded";
      tabstop = 4;
      wrap = false;
      cursorcolumn = false;
      ignorecase = true;
      shiftwidth = 4;
      smartindent = true;
      number = true;
      relativenumber = true;
      termguicolors = true;
      signcolumn = "yes";
      swapfile = false;
    };

    plugins = {
      oil.enable = true;
    };

    plugins.lsp = {
      enable = true;
      keymaps = {
        lspBuf = {
          "<leader>lf" = "format";
        };
      };

      servers = {
        lua_ls.enable = true;
        nil_ls.enable = true;
      };
    };

    plugins.mini = {
      enable = true;
      modules = {
        pick = { };
      };
    };

    globals.mapleader = " ";

    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        action = ":Pick files<CR>";
      }
      {
        mode = "n";
        key = "<leader>h";
        action = ":Pick help<CR>";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":Oil<CR>";
      }
    ];

    extraConfigLua = ''
          vim.api.nvim_create_autocmd('LspAttach', {
          	group = vim.api.nvim_create_augroup('my.lsp', {}),
      	    callback = function(args)
      		    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      		    if client:supports_method('textDocument/completion') then
      			     -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      			     local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      			     client.server_capabilities.completionProvider.triggerCharacters = chars
      			     vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      		     end
      	     end, 
          })
    '';
  };
}
