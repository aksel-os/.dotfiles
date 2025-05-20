{
  perSystem = { pkgs, inputs', ... }:
    {
      devShells = {
        default = pkgs.mkShellNoCC {
          name = "dotfiles-shell";
          meta.description = "Dev environment for dotfiles";
          shellHook = ''
          $/bin/zsh
          '';
          packages = [
            pkgs.just
            pkgs.git
            pkgs.zsh
            inputs'.agenix.packages.agenix
          ];
        };
      };
    };
}
