{ lib, inputs, withSystem, ... }:

let
  inherit
    (lib)
    recursiveUpdate
    concatLists
    singleton # Create single element list
    mkDefault # Set low prio in case of overriding
    optionals # Return list if true
    listToAttrs
  ;
    
  mkHost = {
    self,
      name,
      os ? "nixos",
      arch ? "x86_64",
      nixpkgs,
      darwin,
      modules ? [ ],
      specialArgs ? { },
    ...
  }:
    let
      libSystem = if os == "darwin" then darwin.lib.darwinSystem else nixpkgs.lib.gnixosSystem;
      system = if (os == "nixos") then "${arch}-linux"
               else (if (os == "macos") then "${arch}-darwin"
                     else "${arch}-${os}");
    in
      libSystem {
        specialArgs = recursiveUpdate {
          inherit inputs;
          
        } specialArgs; # Append additional args
        
        modules = concatLists [
          
          # Hosts have a defined path
          [ "${self}/hosts/${name}/home.nix" ]              
          [ "${self}/hosts/${name}/configuration.nix" ]

          (singleton {
            _module.args = withSystem system (
            { self', inputs', ... }:
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
            flake.source = nixpkgs.outPath;
          }))
          
          # Only used by Darwin
          (optionals (os == "darwin") (singleton {
            nixpkgs.source = mkDefault nixpkgs;

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
  
in {
  inherit
    mkHosts;
}

