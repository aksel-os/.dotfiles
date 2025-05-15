let
  homePath = ../modules/home;

  core = homePath + /core;
  optionals = [
    (homePath + /optional/dev)
    (homePath + /optional/ctf)
    (homePath + /optional/vm)
    (homePath + /optional/apps/pandoc.nix)
  ];

in {
  imports = [
    core
  ] ++ optionals;
}
