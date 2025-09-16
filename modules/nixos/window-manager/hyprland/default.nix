{ pkgs, ... }:

{
  imports = [
    
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  # Configuration happens with home-manager in /modules/home/hyprland

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];

    config.hyprland."org.freedesktop.impl.portal.Settings" = "darkman";
  };
}
