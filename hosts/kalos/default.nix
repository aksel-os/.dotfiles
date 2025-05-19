let
  host = "kalos";

  core = ../../modules/core;
  
  shared = [ core ];

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
