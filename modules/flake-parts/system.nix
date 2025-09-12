{ inputs, ... }:
{
  systems = import inputs.systems;

  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          # allowUnsupportedSystem = true; # Racket be racking me
        };

        overlays = [
        ];
      };
    };
}
