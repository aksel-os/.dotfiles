{ self, ... }:
let
  optional = self + /modules/home/optional;
in
{
  imports = [
    ../ssh.nix
    ../sops.nix
    (optional + /ctf)
    (optional + /vm)
    optional
  ];

  config = {
    home = {
      username = "kepler";
      homeDirectory = "/Users/kepler";
    };

    programs.home-manager.enable = true;
  };
}
