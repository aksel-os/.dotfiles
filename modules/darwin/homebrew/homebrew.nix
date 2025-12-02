{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.homebrew.darwinModules.nix-homebrew
  ];

  config = {
    nix-homebrew = {
      enable = true;

      # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
      enableRosetta = true;

      user = "kepler";

      mutableTaps = false;

      # Automatically migrate existing Homebrew installations
      autoMigrate = true;

      # Declerative tap management
      taps = {
        "homebrew/homebrew-core" = inputs.homebrew-core;

        "homebrew/homebrew-cask" = inputs.homebrew-cask;

        "d12frosted/homebrew-emacs-plus" = pkgs.fetchFromGitHub {
          owner = "d12frosted";
          repo = "homebrew-emacs-plus";
          rev = "3e95d573d5f13aba7808193b66312b38a7c66851";
          hash = "sha256-Eepinxv05Yl79AoPVJveGDZPKHhlAes7XtUvrssflrU=";
        };
      };
    };

    homebrew = {
      enable = true;
      caskArgs.require_sha = true;

      onActivation = {
        autoUpdate = true;
        upgrade = true;
        cleanup = "uninstall";
      };

      taps = builtins.attrNames config.nix-homebrew.taps;

      brews = [
        "age"
        "sops"
      ];

      casks = [
        "racket"
        "utm"
        "raycast"
        "rectangle"
        "wireshark"
        "spotify"
      ];
    };
  };
}
