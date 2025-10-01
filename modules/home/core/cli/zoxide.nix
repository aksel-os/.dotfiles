{ pkgs, ... }:

{
  home.packages = [ pkgs.zoxide ];

  packages.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
