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

      # Declerative tap management, I can't be bothered to pin a specific rev
      taps = {
        "homebrew/homebrew-core" = pkgs.fetchFromGitHub {
          owner = "homebrew";
          repo = "homebrew-core";
          rev = "master";
          hash = "sha256-mWyYitwaozxVX8WfRTS8mHkyS2CLjRLizYo0qpxDd7M=";
        };

        "homebrew/homebrew-cask" = pkgs.fetchFromGitHub {
          owner = "homebrew";
          repo = "homebrew-cask";
          rev = "master";
          hash = "sha256-QrDu6Uqeuf4jDhAfbMlceEBBPkWC5tSEPun16XXL9DA=";
        };

        "d12frosted/homebrew-emacs-plus" = pkgs.fetchFromGitHub {
          owner = "d12frosted";
          repo = "homebrew-emacs-plus";
          rev = "master";
          hash = "sha256-Eepinxv05Yl79AoPVJveGDZPKHhlAes7XtUvrssflrU=";
        };
      };
    };

    homebrew = {
      enable = false;
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
