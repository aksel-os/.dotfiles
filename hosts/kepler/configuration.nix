{ config, pkgs, lib, userSettings, systemSettings, ...}:
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
          "${pkgs.kitty}/Applications/kitty.app"
          "/Applications/Spotify.app"
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
