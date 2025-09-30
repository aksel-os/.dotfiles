{ pkgs, config, ... }:

let
  yazi-flavors = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "flavors";
    rev = "main";
    hash = "sha256-+awiEG5ep0/6GaW8YXJ7FP0/xrL4lSrJZgr7qjh8iBc=";
  };

in
{
  home.packages = [ pkgs.yazi ];

  programs.yazi = {
    enable = true;

    settings = {
      mgr = {
        show_hidden = true;
      };

    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = [
            "g"
            "r"
          ];
          run = "shell -- ya emit cd '$(git rev-parse --show-toplevel)'";
          desc = "Go to root of current Git repository";
        }
      ];
    };

    theme = {
      flavor = {
        dark = "catppuccin-mocha";
        light = "catppuccin-latte";
      };
    };
  };

  home.file = {
    "${config.xdg.configHome}/yazi/flavors/catppuccin-mocha.yazi" = {
      source = "${yazi-flavors}/catppuccin-mocha.yazi";
    };

    "${config.xdg.configHome}/yazi/flavors/catppuccin-latte.yazi" = {
      source = "${yazi-flavors}/catppuccin-latte.yazi";
    };
  };
}
