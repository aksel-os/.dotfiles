{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python312
    # pypy3 # Problem with compiling "'ffi_prep_cif_var' has been marked as being introduced in macOS 10.15 here, but the deployment target is macOS 10.13.0"
    basedpyright
    pylint
    python312Packages.autopep8
    python312Packages.numpy
    python312Packages.pip
  ];
}
