{
  pkgs,
  inputs,
  ...
}:

let
  inherit (inputs) secrets;
  
  primaryUser = if pkgs.stdenv.isDarwin
                then "kepler"
                else "empoleon";
  
  userGroup = if pkgs.stdenv.isDarwin
              then "admin"
              else "users";
  
  sshDir = "/Users/kepler/.ssh";

  mkSecret = {
    file,
    mode ? "400",
    owner ? "root",
    group ? "root",
    ...
  }:
  {
    file = "${secrets}/${file}.age";
    inherit mode owner group;
  };
  
in {
  age = {
    identityPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
      "${sshDir}/id_ed25519"
    ];

    secrets = {
      "keys-github" = mkSecret {
        file = "keys/github";
        owner = primaryUser;
        group = userGroup;
      };

      "uni-github" = mkSecret {
        file = "uni/github";
        owner = primaryUser;
        group = userGroup;
      };

      "uni-ssh" = mkSecret {
        file = "uni/github";
        owner = primaryUser;
        group = userGroup;
      };
    };
  };
}
