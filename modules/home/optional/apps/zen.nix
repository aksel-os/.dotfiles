{
  programs.zen-browser = {
    enable = true;

    profiles."default" = {
      containersForce = true;
      containers = {

      };
    };

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;

      DontCheckDefaultBrowser = true;

      EnableTrackingProtection = {
        Cryptomining = true;
      };
    };
  };
}
