let
  host = "kalos";

  core = ../../modules/core;
  homes = ../../home;
  
  shared = [ core homes ];

in {
  systems = [
    {
      inherit host;
      class = "darwin"; 
      arch = "aarch64";
      modules = [] ++ shared;
    }
  ];
}
