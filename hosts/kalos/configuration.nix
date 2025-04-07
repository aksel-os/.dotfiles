{ pkgs, lib, inputs, userSettings, systemSettings, ...}:
{

  imports = [

  ];

  # Nix settings
  nix = {
    enable = true;
    
    package = pkgs.nixVersions.stable;
    
    # gc = {
    #   automatic = true;
    #   interval = "weekly";
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
      # controlcenter.BatteryShowPercentage = true;

      dock = {
        autohide = true;
        show-recents = false;
        persistent-apps = [
          "/Applications/Zen Browser.app"
          "/Applications/Discord.app"
          "/Applications/Spotify.app"
          "/Applications/Microsoft Outlook.app"
          "${pkgs.kitty}/Applications/kitty.app" 
          "${pkgs.emacs}/Applications/emacs-31.0.50.app"
        ];
      };

      finder = {
        AppleShowAllFiles = true;
        _FXSortFoldersFirst = true;
        FXPreferredViewStyle = "icnv";
      };
    };
  };

  # Use Touch ID for sudo
  security.pam.services.sudo_local = {
    enable = true;
    touchIdAuth = true;
  };

  users.users.${userSettings.user} = {
    # isNormalUser = true;
    description = userSettings.user;
    shell = pkgs.zsh;
  };

  system.stateVersion = 5;
}
