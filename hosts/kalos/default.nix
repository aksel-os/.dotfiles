let
  host = "kalos";

  core = ../../modules/core;
in
{
  systems = [
    {
      inherit host;
      class = "darwin";
      arch = "aarch64";
      modules = [ core ];
    }
  ];
}
