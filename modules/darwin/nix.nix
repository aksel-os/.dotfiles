{
  nix = {
    settings.extra-platforms = [
      "aarch64-darwin"
      # "x86_64-darwin"
    ];
  };
  
  services.nix-daemon.enable = true;
}
