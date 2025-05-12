{ inputs, ... }:

{
  systems = inputs.systems;

  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
    };
  };
}
