{ config, pkgs, inputs, ...}:

{
  # services.emacs.enable = true;

  nixpkgs.overlays = [ (import inputs.emacs-overlay) ];
  
  programs.emacs =  { 
    enable = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      config = "${inputs.emacs-config}/init.org";     
      package = pkgs.emacs-git;
      defaultInitFile = true;
      alwaysEnsure = true;
      alwaysTangle = true;
      extraEmacsPackages = epkgs: [            
        epkgs.jinx
        epkgs.vterm
      ];
    });
  };
}
