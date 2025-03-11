{ pkgs, lib, ... }:

{
  java = with pkgs; [
    jdk
    jdt-language-server
  ];
  
  # programs.java = {
  #   enable = true;
  #   package = pkgs.jdk;
  # };
}
