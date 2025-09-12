{
  pkgs,
  inputs,
  ...
}:
let
  emacs-pkg =
    if pkgs.stdenv.isLinux then
      pkgs.emacs-pgtk
    else
      (pkgs.emacs-git).overrideAttrs (o: {
        patches = [
          # "${inputs.emacs-plus}/patches/emacs-31/fix-window-role.patch"
          "${inputs.emacs-plus}/patches/emacs-31/round-undecorated-frame.patch"
          "${inputs.emacs-plus}/patches/emacs-31/system-appearance.patch"
        ];
      });
in
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacsWithPackagesFromUsePackage {
      config = "${inputs.emacs-config}/init.org";
      package = emacs-pkg;
      defaultInitFile = true;
      alwaysEnsure = true;
      alwaysTangle = true;
      extraEmacsPackages =
        epkgs: with epkgs; [
          jinx
          vterm
        ];
    };
  };
}
