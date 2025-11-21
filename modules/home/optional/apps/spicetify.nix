{ inputs, inputs', pkgs, ... }:

let
  plugins = inputs'.spicetify.legacyPackages;

in
{
  imports = [
    inputs.spicetify.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = pkgs.stdenv.isDarwin;
    theme = plugins.themes.catppuccin;
    colorScheme = "mocha";

    enabledExtensions = with plugins.extensions; [
      keyboardShortcut
      fullAppDisplay
    ];
  };
}
