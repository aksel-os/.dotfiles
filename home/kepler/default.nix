let
  homePath = ../modules/home;

  optionals = [
    (homePath + /optional/dev)
    (homePath + /optional/ctf)
    (homePath + /optional/vm)
    (homePath + /optional/apps/pandoc.nix)
  ];

in {
  imports = optionals;
}
