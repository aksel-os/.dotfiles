{ pkgs, ... }:

{
  home.packages = [ pkgs.waybar ];

  programs.waybar = {
    enable = true;

    systemd = {
      enable = true;
    };
  };
}
