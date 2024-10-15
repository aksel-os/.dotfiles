{ config, pkgs, lib, userSettings, systemSettings, ...}:
{

  imports = [

  ];

  services.nix-daemon.enable = true;

  # Nix settings
  nix = {
    warn-dirty = false;
    package = pkgs.nixFlakes;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
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
      menuExtraClock.ShowSeconds = true;
    };

    dock = {
      autohide = true;
      show-recents = false;
      # persistent-apps = [
      #
      # ];
    };

    finder = {
      AppleShowAllFiles = true;
      _FXSortFoldersFirst = true;
      FXPreferredViewStyle = "icvn";
    };
  };

  users.users.${userSettings.user} = {
    # isNormalUser = true;
    description = userSettings.user;
    shell = pkgs.zsh;
  };

  system.stateVersion = 5;
}
