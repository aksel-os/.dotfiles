{ inputs, inputs', ... }:

let
  plugins = inputs'.spicetify.legacyPackages;

in
{
  imports = [
    inputs.spicetify.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;
    theme = plugins.themes.catppuccin;
    colorScheme = "mocha";
  };
}
