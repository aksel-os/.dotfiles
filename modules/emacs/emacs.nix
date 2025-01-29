{ config, pkgs, ...}:

let
  bs-emacs = pkgs.emacs30.override {
    withNativeCompilation = true;
    withTreeSitter = true;
  };
  bs-emacs-with-packages = (pkgs.emacsPackagesFor bs-emacs).emacsWithPackages (epkgs: with epkgs; [
    vertico
    consult
    which-key
    doom-modeline
    magit
    diff-hl
    multiple-cursors
    org-modern
    marginalia
    nix-mode
    corfu
    orderless
    define-word
    catppuccin-theme
    move-text
    org-appear
    org-fragtog
  ]);

in {
  programs.emacs = { 
    enable = true;
    package = bs-emacs-with-packages;
    extraConfig = builtins.readFile ./init.el; 
  };
}
