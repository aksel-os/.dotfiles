{
  nixpkgs.config = {
    # I don't like Unfree, but spicetify and discord requires it
    allowUnfree = true;
    allowUnfreePredicate = true;

    allowBroken = false;
  };
}
