{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings.default_session = {
      # command = "hyprland";
      command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd hyprland";
      user = "greeter";
    };
  };
}
