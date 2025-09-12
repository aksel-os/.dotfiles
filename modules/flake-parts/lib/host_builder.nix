{
  inputs ? throw "No inputs provided",
  lib ? inputs.nixpkgs.lib,
  withSystem,
  ...
}:
let
  inherit (inputs) self;

  inherit (lib.attrsets) recursiveUpdate listToAttrs;
  inherit (lib.lists) singleton optionals concatLists;
  inherit (lib.modules) mkDefault;

  mkHost =
    {
      name,
      os,
      arch,
      modules ? [ ],
      specialArgs ? { },
      ...
    }:
    let
      libSystem =
        if os == "darwin" then inputs.darwin.lib.darwinSystem else inputs.nixpkgs.lib.nixosSystem;
      system =
        if (os == "nixos") then
          "${arch}-linux"
        else
          (if (os == "macos") then "${arch}-darwin" else "${arch}-${os}");
    in
    libSystem {
      specialArgs = recursiveUpdate {
        inherit lib inputs self;
      } specialArgs; # Append additional args

      modules = concatLists [
        # Hosts have a defined path
        [ "${self}/hosts/${name}/home.nix" ]
        [ "${self}/hosts/${name}/configuration.nix" ]

        (singleton {
          _module.args = withSystem system (
            {
              self',
              inputs',
              ...
            }:
            {
              inherit self' inputs';
            }
          );
        })

        # Base reqs
        (singleton {
          networking.hostName = mkDefault name;

          nixpkgs.hostPlatform = mkDefault system;
        })

        # Only used by NixOS
        (optionals (os != "darwin") (singleton {
          flake.source = inputs.nixpkgs.outPath;
        }))

        # Only used by Darwin
        (optionals (os == "darwin") (singleton {
          nixpkgs.source = mkDefault inputs.nixpkgs;

          system = {
            checks.verifyNixPath = false;

            darwinVersionSuffix = ".${inputs.darwin.shortRev or inputs.darwin.dirtyShortRev or "dirty"}";
            darwinRevision = inputs.darwin.rev or inputs.darwin.dirtyRev or "dirty";
          };
        }))

        # Append extra modules
        modules
      ];
    };

  mkHosts =
    hosts:
    listToAttrs (
      map (host: {
        name = host.name;

        value = mkHost host;
      }) hosts
    );
in
{
  inherit
    mkHosts
    ;
}
