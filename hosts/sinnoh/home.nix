{ lib, pkgs, inputs, userSettings, ...}:

{
  home = {
    packages = with pkgs; [ hello ];
    username = "empoleon";
    homeDirectory = "/home/empoleon";

    stateVersion = "23.11";
  };
}
