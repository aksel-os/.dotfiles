{ pkgs, config, ... }:

let
  atuin-catpiss = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "atuin";
    rev = "main";
    hash = "sha256-t/Pq+hlCcdSigtk5uzw3n7p5ey0oH/D5S8GO/0wlpKA=";
  };
  
in {
  home.packages = [ pkgs.atuin ];

  programs.atuin = {
    enable = true;    settings = {
      theme.name = "catppuccin-mocha-blue";
    };

    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  
  home.file = {
    "${config.xdg.configHome}/atuin/themes/catppuccin-mocha-blue" = {
      source = "${atuin-catpiss}/themes/catppuccin-mocha-blue";
    };

    "${config.xdg.configHome}/atuin/themes/catppuccin-latte-blue" = {
      source = "${atuin-catpiss}/themes/catppuccin-latte-blue";
    };
  };
}
