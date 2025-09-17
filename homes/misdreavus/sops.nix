{ inputs, ... }:

{
  sops = {
    age.keyFile = "/var/lib/sops-nix/key.txt";

    defaultSopsFile = "${inputs.secrets}/secrets.yaml";
    validateSopsFiles = false;
  };
}
