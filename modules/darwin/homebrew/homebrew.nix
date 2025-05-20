{
  pkgs
, config
, ...
}:

{
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
        "homebrew/homebrew-core" = pkgs.fetchFromGitHub {
          owner = "homebrew";
          repo = "homebrew-core";
          rev = "da3f6d90344231a582630ad915b4f1aee516f57d";
          hash = "sha256-6bpTS9EhefG9Ir5TgAHa1wxz4wB6/3GeOdx6KFWYtsI=";
        };

        "homebrew/homebrew-cask" = pkgs.fetchFromGitHub {
          owner = "homebrew";
          repo = "homebrew-cask";
          rev = "da8791ec611a7d32d4767ab697c7c09fe757b8cc";
          hash = "sha256-aS1ZEGDMKG9Dg3k40+aKrl1GnWxO78lxTwJ2PIh32+g=";
        };

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
        
      ];
      
      casks = [
        
      ];
    };
  };
}
