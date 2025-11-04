{ inputs, pkgs, ... }:

{
  modules = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;
    settings = {

    };
  };
}
