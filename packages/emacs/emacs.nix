{ config, pkgs, ...}:

{

  home.packages = [ pkgs.emacs ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraConfig = builtins.readFile ./init.el; 
    extraPackages = (epkgs: (with epkgs; [
      vertico savehist consult which-key
      magit
      nix-mode org-mode
      catppuccin-theme
    ]))
  };

}
