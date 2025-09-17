let
  host = "johto";

  core = ../../modules/core;

  shared = [ core ];
in
{
  systems = [
    {
      inherit host;
      class = "nixos";
      arch = "aarch64";
      modules = [
        ./vm/hardware.nix
        ./sops.nix
      ]
      ++ shared;
    }
  ];
}
