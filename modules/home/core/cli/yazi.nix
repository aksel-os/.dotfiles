{ pkgs, config, ... }:

let
  yazi-flavors = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "flavors";
    rev = "36c49acfd7d3924bd751fd74e37b6ff438af691a";
    hash = "sha256-IK0Ye/EPjOGC+//HpjExVTAKfXtlgOrYbFLrhy/DF6k=";
  };

in
{
  home.packages = [ pkgs.yazi ];

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";

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
