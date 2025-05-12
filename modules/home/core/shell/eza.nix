{ pkgs, ... }:

{
  home.packages = [ pkgs.eza ];

  programs.eza = {
    enable = true;

    icons = "auto";

    extraOptions = [
      "--group"
      "--group-directories-first"
      "--header"
      "--octal-permissions"
    ];
  };
}
