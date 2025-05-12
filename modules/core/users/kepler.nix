{ pkgs, ... }:

{
  users.users.kepler = {
    home = if pkgs.stdenv.isDarwin then "/Users/kepler" else "/home/kepler";
    shell = pkgs.zsh;
  };
}
