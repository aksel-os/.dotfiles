{
  inputs,
  pkgs,
  config,
  ...
}:

{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = false;
    autoStart = true;
    settings = {

    };
  };
}
