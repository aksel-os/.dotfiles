{ inputs, pkgs, config, ... }:

{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;
    settings = {

    };
  };
}
