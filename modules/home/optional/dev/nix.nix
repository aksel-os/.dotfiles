{pkgs, ...}: {
  home.packages = [pkgs.nil pkgs.alejandra pkgs.nixfmt-rfc-style];
}
