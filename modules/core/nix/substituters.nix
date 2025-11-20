# Substituters help with speeding up the process of downloading stuffs
# They should rank in the order of most likely to succeed to least likely

{
  nix.settings = {
    substituters = [
      "https://cache.nixos.org?priority=10" # Official binary cache, in theory loaded by default
      "https://nix-community.cachix.org" # Nix-community cache, contains emacs-overlay
      "https://hyprland.cachix.org" # hyprland, need I say more
      "https://vicinae.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" # https://github.com/NixOS/nixpkgs/blob/1f949558617ebb18bbf7005c1c4dc3407d391e93/nixos/modules/services/misc/nix-daemon.nix#L806
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };
}
