{
  lib,
  inputs,
  config,
  ...
}:

let
  inherit (lib.attrsets) filterAttrs mapAttrs;
  inherit (lib.modules) mkForce mkDefault;

  flakes = filterAttrs (name: value: value ? outputs) inputs;

in
{
  nix = {
    # https://discourse.nixos.org/t/how-to-pin-nix-registry-nixpkgs-to-release-channel/14883/4
    registry = (mapAttrs (_: flake: { inherit flake; }) flakes) // {
      # https://github.com/NixOS/nixpkgs/pull/388090
      nixpkgs = mkForce { flake = inputs.nixpkgs; };
    };

    settings = {

      # Nix store optimize automatically
      # No work with Darwin https://github.com/NixOS/nix/issues/7273
      # auto-optimise.store = pkgs.stdenv.isLinux;

      # Users who can interact with the nix daemon
      allowed-users = [
        "misdreavus"
        "kepler"
        "@wheel"
        "root"
      ];

      # Users who can manage the nix store
      trusted-users = [
        "misdreavus"
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

      # extraOptions = ''
      #   !include ${config.sops.secrets."keys/ssh/github".path}
      # '';

      # I'm not dirty, nor smelly!
      warn-dirty = false;
    };
  };
}
