# I didn't find anywhere else to put this
{ self, pkgs, ... }:

{
  system = {
    # First version your Nix was generated with
    stateVersion = if pkgs.stdenv.isDarwin then 5 else "24.05";

    # Git revision of top-level flake
    configurationRevision = self.shortRev or self.dirtyShortRev or "dirty";
  };
}
