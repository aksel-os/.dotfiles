{ config, pkgs, ...}:

let
  bs-emacs = pkgs.emacs30.override {
    withNativeCompilation = true;
    withTreeSitter = true;
  };
  bs-emacs-with-packages = (pkgs.emacsPackagesFor bs-emacs).emacsWithPackages (epkgs: with epkgs; [
    vertico
    consult
    corfu
    cape
    orderless
    which-key
    doom-modeline
    magit
    diff-hl
    hl-todo
    multiple-cursors
    marginalia
    nix-mode
    define-word
    catppuccin-theme
    move-text
    pdf-tools
    org-modern
    org-appear
    org-fragtog
    olivetti
    vterm
  ]);

in {
#  services.emacs.enable = true;
  
  programs.emacs = { 
    enable = true;
    package = bs-emacs-with-packages;
    extraConfig = builtins.readFile ./init.el; 
  };
}
