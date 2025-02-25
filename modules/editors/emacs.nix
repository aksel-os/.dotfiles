{ config, pkgs, inputs, systemSettings, ...}:

{
  # services.emacs.enable = if (systemSettings.hostname != "kalos") then true else false;

  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  
  programs.emacs =  { 
    enable = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      # config = "${inputs.emacs-config}/init.org";
      config = "./init.org";
      package = if (systemSettings.hostname != "kalos") then pkgs.emacs-pgtk else pkgs.emacs-git;
      defaultInitFile = true;
      alwaysEnsure = true;
      alwaysTangle = true;
      extraEmacsPackages = epkgs: with epkgs; [
        # The following packages are for some reason not downloaded from the config
        jinx
        vterm
      ];
    });
  };
}
