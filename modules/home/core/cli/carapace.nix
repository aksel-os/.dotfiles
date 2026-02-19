{ pkgs, ... }:

{
  home.packages = [ pkgs.carapace ];

  programs.carapace = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };
}
