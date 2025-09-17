{ inputs, secrets, ... }:

{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "/var/lib/sops-nix/key.txt";

    defaultSopsFile = "${secrets}/secrets.yaml";
    validateSopsFiles = false;
  };
}
