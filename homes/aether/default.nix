{ lib, ... }:

let
  optional = ../../modules/home/optional;

in
{
  imports = [
    (optional + /apps/zen.nix)
    (optional + /dev)
    ../ssh.nix
    ../sops.nix
  ];

  config = {
    home = {
      username = lib.mkDefault "aether";
      homeDirectory = lib.mkDefault "/home/aether";
    };

    programs.home-manager.enable = true;
  };
}
