{ config, pkgs, userSettings, ... }:

{

  home.packages = [ pkgs.texlive ];
    programs.texlive = {
      enable = true
    };
  };

}
