{ self, ... }:
let
  # homePath = (self + /modules/home);
  optionals = self + /modules/home/optional;
in
{
  imports = [
    ./ssh.nix
    ./sops.nix
    optionals
  ];

  config = {
    home = {
      username = "kepler";
      homeDirectory = "/Users/kepler";
    };

    programs.home-manager.enable = true;
  };
}
