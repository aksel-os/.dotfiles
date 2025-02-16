{ config, pkgs, inputs, ...}:

{
  #  services.emacs.enable = true;

  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  
  programs.emacs =  { 
    enable = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      # config = "github:aksel-os/.emacs.d/init.org";
      config = "init.org";
      package = pkgs.emacs-git;
      defaultInitFile = true;
      alwaysEnsure = true;
      alwaysTangle = true;
    });
  };
}
