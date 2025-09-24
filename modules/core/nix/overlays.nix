{ inputs, ... }:

{
  nixpkgs.overlays = [
    (import inputs.emacs-overlay)
    (import inputs.neovim-overlay)
  ];
}
