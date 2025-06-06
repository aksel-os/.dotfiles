{ ... }:

{
  services.skhd = {
    enable = false;
    skhdConfig = ''
      # open terminal
      cmd - return : /Users/kepler/.nix-profile/bin/kitty
      cmd - e : /Users/kepler/.nix-profile/bin/emacs-31.05.50

      # move focus between windows
      cmd - h : yabai -m window --focus west
      cmd - j : yabai -m window --focus south
      cmd - k : yabai -m window --focus north
      cmd - l : yabai -m window --focus east

      # move focus between spaces
      cmd - 1 : yabai -m space --focus 1
      cmd - 2 : yabai -m space --focus 2
      cmd - 3 : yabai -m space --focus 3
      cmd - 4 : yabai -m space --focus 4
      cmd - 5 : yabai -m space --focus 5
      cmd - 6 : yabai -m space --focus 6
      cmd - 7 : yabai -m space --focus 7
      cmd - 8 : yabai -m space --focus 8  
      cmd - 9 : yabai -m space --focus 9

      # move focus between displays
      shift + cmd - up : yabai -m display --focus east
      shoft + cmd - down : yabai -m display --focus west

      # move app to workspace
      shift + cmd - 1 : yabai -m window --space 1
      shift + cmd - 2 : yabai -m window --space 2
      shift + cmd - 3 : yabai -m window --space 3
      shift + cmd - 4 : yabai -m window --space 4
      shift + cmd - 5 : yabai -m window --space 5
      shift + cmd - 6 : yabai -m window --space 6
      shift + cmd - 7 : yabai -m window --space 7
      shift + cmd - 8 : yabai -m window --space 8
      shift + cmd - 9 : yabai -m window --space 9

      # delete focused window
      cmd - q : yabai -m window --close          
    '';
  };
}
