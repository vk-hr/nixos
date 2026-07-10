{ pkgs, ... }:

{
  programs.bun.enable = true;

  home.packages = with pkgs; [
    nodejs
    typescript
    typescript-language-server
    biome
  ];
}
