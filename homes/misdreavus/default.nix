{ lib, ... }:

let
  optional = ../../modules/home/optional;

in
{
  imports = [
    (optional + /apps/zen.nix)
    ./ssh.nix
    ./sops.nix
  ];

  config = {
    home = {
      username = lib.mkDefault "misdreavus";
      homeDirectory = lib.mkDefault "/home/misdreavus";
    };

    programs.home-manager.enable = true;
  };
}
