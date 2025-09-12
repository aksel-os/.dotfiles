# This builder was made with a ton of help from this blog www.isabelroses.com/blog/custom-lib-nixossystem/
{
  inputs ? throw "No inputs provided",
  lib ? inputs.nixpkgs.lib,
  withSystem ? inputs.flake-parts.withSystem,
  ...
}:
let
  inherit (inputs) self;

  inherit (lib.modules) mkDefault evalModules;
  inherit (lib.lists) optionals singleton concatLists;
  inherit (lib.attrsets) recursiveUpdate listToAttrs;

  mkSystem =
    {
      host,
      arch ? "x86_64",
      class ? "nixos",
      modules ? [ ],
      specialArgs ? { },
      ...
    }:
    let
      nixpkgs = inputs.nixpkgs or (throw "No nixpkgs input found!");
      darwin = inputs.darwin or inputs.nix-darwin or (throw "No nix-darwin input found!");

      modulesPath = if (class == "darwin") then "${darwin}/modules" else "${nixpkgs}/nixos/modules";

      baseModules = import "${modulesPath}/module-list.nix";

      system = if (class == "nixos") then "${arch}-linux" else "${arch}-${class}";

      eval = evalModules {
        # A nominal type for modules. When set and non-null, this adds a check to
        # make sure that only compatible modules are imported.
        inherit class;

        # This should only be used for special arguments that need to be evaluated
        # when resolving module structure (like in imports). For everything else,
        # there's _module.args. If specialArgs.modulesPath is defined it will be
        # used as the base path for disabledModules.
        specialArgs = recursiveUpdate {
          inherit lib;
          inherit self inputs;
          inherit modulesPath;
        } specialArgs;

        modules = concatLists [
          [ "${self}/modules/${class}/default.nix" ]

          # This is the module list used to find what
          # darwin or nixpkgs can install
          baseModules

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
            networking.hostName = mkDefault host;

            # This is the 'inherit system' in your regular config
            nixpkgs.hostPlatform = mkDefault system;
          })

          # Only used by Linux
          (optionals (class != "darwin") (singleton {
            nixpkgs.flake.source = nixpkgs.outPath;
          }))

          # Only used by Darwin
          (optionals (class == "darwin") (singleton {
            nixpkgs.source = nixpkgs.outPath;

            system = {
              checks.verifyNixPath = false;

              darwinVersionSuffix = ".${darwin.shortRev or darwin.dirtyShortRev or "dirty"}";
              darwinRevision = darwin.rev or darwin.dirtyRev or "dirty";
            };
          }))

          # Append extra modules

          modules
        ];
      };
    in
    if class == "darwin" then (eval // { system = eval.config.system.build.toplevel; }) else eval;

  mkSystems =
    systems:
    listToAttrs (
      map (system: {
        name = system.host;

        value = mkSystem system;
      }) systems
    );
in
{
  inherit mkSystems;
}
