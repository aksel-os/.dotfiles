{
  perSystem = { pkgs, ... }:
    {
      devShells = {
        default = pkgs.mkShellNoCC {
          name = "dotfiles-shell";
          meta.description = "Dev environment for dotfiles";
          shellHook = ''
          $/bin/zsh
          '';
          packages = with pkgs; [
            just
            git
            zsh
          ];
        };
      };
    };
}
