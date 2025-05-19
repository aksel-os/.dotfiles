{ lib, pkgs, inputs, ... }:

let
  inherit (lib.attrsets) filterAttrs mapAttrs;
  inherit (lib.modules) mkForce mkDefault;
  
  flakes = filterAttrs (name: value: value ? outputs) inputs;

in {
  nix = {
    # https://discourse.nixos.org/t/how-to-pin-nix-registry-nixpkgs-to-release-channel/14883/4
    registry = (mapAttrs (_: flake: {inherit flake; }) flakes) // {
      # https://github.com/NixOS/nixpkgs/pull/388090
      nixpkgs = mkForce { flake = inputs.nixpkgs; };
    };
    
    gc = {
      automatic = true;
      interval = mkDefault { Minute = 0; Hour = 10; Weekday = 1; };
      options = "--delete-older-than 7d";
    };

    settings = {

      # Nix store optimize automatically
      # No work with Darwin https://github.com/NixOS/nix/issues/7273
      # auto-optimise.store = pkgs.stdenv.isLinux;

      # Users who can interact with the nix daemon
      allowed-users = [
        "kepler"
        "@wheel"
        "root"
      ];

      # Users who can manage the nix store
      trusted-users = [
        "kepler"
        "@wheel"
        "root"
      ];

      max-jobs = "auto";

      system-features = [
        "kvm"
        "recursive-nix"
      ];

      # Stop cutting off at fucking 5 lines of errors
      log-lines = 30;

      extra-experimental-features = [
        "flakes"
        "nix-command"
      ];

      # I'm not dirty, nor smelly!
      warn-dirty = false; 
    };
  };
}
