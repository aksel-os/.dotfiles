{
  lib,
  pkgs,
  inputs,
  userSettings,
  ...
}:

{
  home = {
    username = userSettings.user;
    homeDirectory = "/home/${userSettings.user}";

    stateVersion = "24.05"; # Don't change
  };

  imports = [
    # inputs.home-manager.nixosModules.home-manager

    # Terminal ++
    # ../../modules/desktop/term/kitty.nix
    # ../../modules/shell

    # Editor
    # ../../modules/editors

    # Programming languages
    # ../../modules/dev

    # Virtualization
    # ../../modules/apps/vm
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
