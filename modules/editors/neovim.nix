{ pkgs, lib, ... }:

{
  home.packages = [ pkgs.neovim ];

  programs.neovim = {
    enable = true;
  };
}
