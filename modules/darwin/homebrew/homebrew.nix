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
          rev = "3e95d573d5f13aba7808193b66312b38a7c66851"; # main 31.03.2025
          hash = "sha256-Eepinxv05Yl79AoPVJveGDZPKHhlAes7XtUvrssflrU=";
        };

        "cormacrelf/homebrew-dark-notify" = pkgs.fetchFromGitHub {
          owner = "cormacrelf";
          repo = "homebrew-dark-notify";
          rev = "9b85a0d2a62385baeed6b20046104baba56453dc"; # main 20.02.2026
          hash = "sha256-XGvgNHmh5/2Z5vonSw3DvsIlEoFhQWua4M/1DYWGcco=";
        };

        "Jetbrains/utils" = pkgs.fetchFromGitHub {
          owner = "JetBrains";
          repo = "homebrew-utils";
          rev = "e664ad2d3d434fa4a24fdf0f9d8f649d5a801161"; # main 20.05.2026
          hash = "sha256-jVFkLMIazYsAsdfvCYCg7u6kSfXan1Gv6f1KP4u3eAE=";
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
        "gcc"
        "gitu"
        "dark-notify"
        "kotlin-lsp" # Official Kotlin LSP
      ];

      casks = [
        "racket"
        "utm"
        "raycast"
        "rectangle"
        "wireshark-app"
        "android-studio"
        "prismlauncher"
        "slack"
        "postman"
        "betterdisplay"
        "discord" # Vesktop is currently fucked up
        "pycharm" # Free for students :)
        "obsidian"
        "webstorm" # Webdev
        "linearmouse"
        "docker-desktop"
      ];
    };
  };
}
