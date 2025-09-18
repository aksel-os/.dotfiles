{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings.default_session = {
      # command = "hyprland";
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-session --sessions ${pkgs.hyprland}/share/wayland-sessions";
      user = "misdreavus";
    };
  };
}
