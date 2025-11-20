let
  mod = "SUPER";

in
{
  wayland.windowManager.hyprland.settings.bind = [
    # App launchers / session
    # "${mod}, Space, exec, rofi -show drun -show-icons"
    "${mod}, Space, exec, vicinae toggle"
    "${mod}, Return, exec, kitty"
    "${mod}, E, exec, emacs"
    "${mod}, B, exec, zen"
    "${mod}, Q, killactive"
    "${mod}, D, exec, darkman toggle"

    # Workspaces
    "${mod}, 1, workspace, 1"
    "${mod}, 2, workspace, 2"
    "${mod}, 3, workspace, 3"
    "${mod}, 4, workspace, 4"
    "${mod}, 5, workspace, 5"
    "${mod}, 6, workspace, 6"
    "${mod}, 7, workspace, 7"
    "${mod}, 8, workspace, 8"
    "${mod}, 9, workspace, 9"

    "${mod} Shift, 1, movetoworkspace, 1"
    "${mod} Shift, 2, movetoworkspace, 2"
    "${mod} Shift, 3, movetoworkspace, 3"
    "${mod} Shift, 4, movetoworkspace, 4"
    "${mod} Shift, 5, movetoworkspace, 5"
    "${mod} Shift, 6, movetoworkspace, 6"
    "${mod} Shift, 7, movetoworkspace, 7"
    "${mod} Shift, 8, movetoworkspace, 8"
    "${mod} Shift, 9, movetoworkspace, 9"    
  ];
}
