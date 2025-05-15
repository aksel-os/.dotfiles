{
  nixpkgs.config = {
    # I don't like Unfree, so I have disabled it for now
    allowUnfree = false;
    allowUnfreePredicate = false;

    allowBroken = false;
  };
}
