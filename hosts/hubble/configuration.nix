{ pkgs, lib, inputs, userSettings, systemSettings, ...}:
{

  imports = [

  ];

  services.nix-daemon.enable = true;

  # Nix settings
  nix = {
    package = pkgs.nixFlakes;
    # gc = {
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 7d";
    # };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';    
  };

  # Nix-darwin/ System settings
  time.timeZone = systemSettings.timezone; 
  
  fonts.packages = import ../../modules/fonts/fonts.nix { inherit pkgs; };
  
  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    defaults = {
      menuExtraClock.Show24Hour = true;
      menuExtraClock.ShowSeconds = false;

      dock = {
        autohide = true;
        show-recents = false;
        persistent-apps = [
          "/Applications/Arc.app"
          "/Applications/Discord.app"
          "/Applications/Spotify.app"
          # "${pkgs.kitty}/Applications/kitty.app" 
          # "${pkgs.emacs}/Applications/Emacs.app"
        ];
      };

      finder = {
        AppleShowAllFiles = true;
        _FXSortFoldersFirst = true;
        FXPreferredViewStyle = "icnv";
      };
    };
  };

  users.users.${userSettings.user} = {
    # isNormalUser = true;
    description = userSettings.user;
    shell = pkgs.zsh;
  };

  system.stateVersion = 5;
}
