{ self, ... }:

let
  # homePath = (self + /modules/home);

  optionals = (self + /modules/home/optional);

in {
  imports = [ optionals
              ./secrets.nix
            ];

  config = {
    home = {
      username = "kepler";
      homeDirectory = "/Users/kepler";
    };

    programs.home-manager.enable = true;
  };
}
