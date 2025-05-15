{ ... }:

{
  programs.nh = {
    enable = true;
    clean = {
      enable = false;
      dates = "weekly";
    };
  };
}
