{ pkgs, ... }:

{
  nix = {
    gc = {
      automatic = true;
      interval = { Minute = 0; Hour = 10; Weekday = 1; };
      options = "--delete-older-than 7d";
    };

    settings = {

      # Nix store optimize automatically
      # No work with Darwin https://github.com/NixOS/nix/issues/7273
      auto-optimise.store = pkgs.stdenv.isLinux;

      allowed-users = [
        "@wheel"
        "root"
      ];

      trusted-users = [
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
