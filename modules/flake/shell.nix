{
  perSystem = { pkgs, ... }:
    {
      devShells = {
        default = pkgs.mkShellNoCC {
          name = "init dotfiles";
          packages = with pkgs; [
            just
            git
          ];
        };
      };
    };
}
