{ pkgs, ... }:


{
  imports = [
    ../../modules/desktop/yabai.nix
    ../../modules/desktop/skhd.nix
    ../../modules/shell/manuals.nix
  ];

  # Nix settings
  nix = {
    enable = true;
    
    package = pkgs.nixVersions.stable;
    
    gc = {
      automatic = true;
      interval = { Minute = 0; Hour = 10; Weekday = 1; };
      options = "--delete-older-than 7d";
    };
    
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    taps = [
      {
        name = "d12frosted/emacs-plus";
        clone_target = "https://github.com/d12frosted/homebrew-emacs-plus.git";
        force_auto_update = true;    
      }
    ];
    brews = [
    ];
  };

  # Nix-darwin/ System settings
  time.timeZone = "Europe/Oslo"; 
  
  # fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
  
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

  users.users."kepler" = {
    # isNormalUser = true;
    shell = pkgs.zsh;
  };

  system.stateVersion = 5;
}
