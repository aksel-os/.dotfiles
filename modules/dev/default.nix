{ pkgs, lib, ... }:

{
  home.packages = import ./c.nix ++
                  import ./java.nix ++
                  import ./python.nix;
}
