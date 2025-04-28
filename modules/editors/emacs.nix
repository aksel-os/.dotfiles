{ config, pkgs, inputs, systemSettings, ...}:

{
  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  
  programs.emacs =  { 
    enable = false;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      config = "${inputs.emacs-config}/init.org";
      # config = "./init.org";
      package = if (systemSettings.hostname != "kalos") then pkgs.emacs-pgtk
                else pkgs.emacs-git;
                  (pkgs.emacs-git).overrideAttrs (o: {
                    patches = [
                      "${inputs.emacs-plus}/patches/emacs-31/fix-window-role.patch"
                      "${inputs.emacs-plus}/patches/emacs-31/round-undecorated-frame.patch"
                      "${inputs.emacs-plus}/patches/emacs-31/system-appearance.patch"
                    ];
                  });

      defaultInitFile = true;
      alwaysEnsure = true;
      alwaysTangle = true;
      extraEmacsPackages = epkgs: with epkgs; [
        jinx
        vterm
      ];
    });
  };
}
