let
  mod = "SUPER";

in {
  wayland.windowManager.hyprland.settings.bind = [
    # App launchers / session
      "${mod}, Return, exec, kitty"
      "${mod}, E, exec, emacs"
      "${mod}, B, exec, zen"
      "${mod}, Q, killactive"
      "${mod}, D, exec, darkman toggle"
  ];
}
