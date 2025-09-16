{ lib, config, ... }:

{
  security.rtkit.enable = lib.mkForce config.services.pipewire.enable;
}
