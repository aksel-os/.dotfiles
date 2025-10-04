{ inputs, config, ... }:

{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    defaultSopsFile = "${inputs.secrets}/secrets.yaml";

    age.sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519" ];

    secrets = {
      "keys/ssh/github" = { };

      "keys/ssh/uio" = { };
    };
  };
}
