{ config, pkgs, userSettings, ... }:

{

  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

}
