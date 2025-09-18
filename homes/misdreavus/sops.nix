{ inputs, config, ... }:

{
  sops = {
    # age.keyFile = "/var/lib/sops-nix/key.txt";
    age.sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/id_ed25519" ];

    defaultSopsFile = "${inputs.secrets}/secrets.yaml";

    secrets = {
      "keys/ssh/github" = { };

      "keys/ssh/uio" = { };
    };
  };
}
