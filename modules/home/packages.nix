{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    neovim
    htop
    fzf
    foot
    zed-editor
    helium
    fuzzel
    wl-clipboard
    xwayland
    nil
    nixd
    nixfmt
  ];
}
