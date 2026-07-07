{ pkgs, ... }:

{
  programs.go = {
    enable = true;
    package = pkgs.go;
  };

  home.packages = with pkgs; [
    gopls
    delve
    golangci-lint
    gotools
  ];
}
