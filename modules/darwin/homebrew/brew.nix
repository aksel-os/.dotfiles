{
  config = {
    homebrew = {
      enable = true;
      caskArgs.require_sha = true;

      onActivation = {
        autoUpdate = true;
        upgrade = true;
        cleanup = "uninstall";
      };

      taps = [
        {
          name = "d12frosted/emacs-plus";
          clone_target = "https://github.com/d12frosted/homebrew-emacs-plus.git";
          force_auto_update = true;            
        }
      ];

      brews = [
        
      ];

      casks = [
        
      ];
    };
  };
}
