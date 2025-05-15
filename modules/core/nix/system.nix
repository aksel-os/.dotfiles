# I didn't find anywhere else to put this
{ self, ... }:

{
  system = {
    # First version your Nix was generated with
    stateVersion = "24.05";

    # Git revision of top-level flake
    configurationRevision = self.shortRev or self.dirtyShortRev or "dirty";
  };
}
