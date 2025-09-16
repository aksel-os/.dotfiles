{
  nix = {
    enable = true;

    gc = {
      automatic = true;
      interval = mkDefault {
        Minute = 0;
        Hour = 10;
        Weekday = 1;
      };
      options = "--delete-older-than 7d";
    };    

    settings.extra-platforms = [
      "aarch64-darwin"
      # "x86_64-darwin"
    ];
  };
}
