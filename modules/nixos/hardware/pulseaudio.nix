{ config, ... }:

{
  services.pulseaudio.enable = !config.services.pipewire.enable;
}
