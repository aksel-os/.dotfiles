{ pkgs, lib, ... }:

{
  users.users.kepler = lib.mkIf pkgs.stdenv.isDarwin {
    home = "/Users/kepler";
    shell = pkgs.zsh;
  };
}
