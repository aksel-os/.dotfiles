{
  nix = {
    enable = true;
    
    settings.extra-platforms = [
      "aarch64-darwin"
      # "x86_64-darwin"
    ];
  };
}
