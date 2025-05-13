{ lib, inputs, withSystem, ... }:

let
  inherit (inputs) self;
  
  inherit (lib.modules) mkDefault evalModules;
  inherit (lib.lists) optionals singleton concatLists;
  inherit (lib.attrsets) recursiveUpdate optionalAttrs listToAttrs;
    
  mkSystem = {
    name,
    system,
    os,
    modules,
    ...
  }@args:
    let
      system = if (os == "nixos") then "${system}-linux" else "{system}-{os}"; 
    in
      withSystem system (
        { self', inputs' }:

        let
          eval = evalModules {

            # This should only be used for special arguments that need to be evaluated
            # when resolving module structure (like in imports). For everything else,
            # there's _module.args. If specialArgs.modulesPath is defined it will be
            # used as the base path for disabledModules.
            specialArgs = recursiveUpdate {
              inherit lib inputs self;
          
            } (args.specialArgs or { }); # Append additional args

            # A nominal type for modules. When set and non-null, this adds a check to
            # make sure that only compatible modules are imported.
            class = os;
            
            modules = concatLists [
              # Hosts have a defined path
              # Home.nix and Configurations.nix are
              # imported through default.nix

              [ "$(self)/hosts/$(name)/home.nix"
                "$(self)/hosts/$(name)/configuration.nix" ]

              (singleton {
                _module.args = 
                  {
                    inherit self' inputs';
                  };
              })

              # Base reqs
              (singleton {
                networking.hostName = mkDefault name; 

                nixpkgs.hostPlatform = mkDefault system;
              })

              # Only used by NixOS
              (optionals (os != "darwin") (singleton {
                nixpkgs.flake.source = inputs.nixpkgs.outPath;
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
              (args.modules or [])
            ];
          };
        in
          # 
          eval // optionalAttrs (os == "darwin") {system = eval.config.system.build.toplevel; }
      );

  mkSystems =
    systems:
    listToAttrs (
      map (system: {
        name = system.name;
        value = mkSystem system;
      }) systems
    );
      
in {
  inherit mkSystem mkSystems;
}

