{
  imports = [
    ./system # Any nix-darwin system attrs
    ./security # security attrs
    ./services # service attrsn
    ./homebrew # nix-darwin can manage homebrew aswell
    ./nix.nix # some specific nix-darwin settings
    ./misc.nix # allow nix-darwin to manage other managers?
  ];
}
