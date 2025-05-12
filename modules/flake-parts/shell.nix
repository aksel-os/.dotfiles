{
  perSystem = { pkgs, ... }:
    {
      devShells = {
        default = pkgs.mkShellNoCC {
          name = "dotfiles-shell";
          meta.description = "Dev environment for dotfiles";
          packages = with pkgs; [
            just
            git
          ];
        };
      };
    };
}
