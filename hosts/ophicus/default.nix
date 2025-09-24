let
  core = ../../modules/core;

in
{
  systems = [
    {
      host = "ophicus";
      class = "nixos";
      arch = "aarch64";
      modules = [
        ./disko
        core
      ];
    }
  ];
}
