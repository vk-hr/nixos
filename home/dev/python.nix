{ pkgs, ... }:

{
  home.packages = with pkgs; [
    uv
    python3
    ruff
    pyright
  ];
}
