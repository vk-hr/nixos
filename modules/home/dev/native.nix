{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    clang-tools
    cmake
    ninja
    gnumake
    gdb
    ccache
  ];

  home.sessionVariables.CCACHE_DIR = "$HOME/.cache/ccache";
}
