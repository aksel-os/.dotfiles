{ pkgs, ... }:

{
  home.packages = [ pkgs.bat ];

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
    };
  };
}
