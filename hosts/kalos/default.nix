let host = "kalos";

in {
  systems = [
    {
      inherit host;
      class = "darwin"; 
      arch = "aarch64";
    }
  ];
}
