{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    neovim
    htop
    fzf
    ghostty
    zed-editor
    fuzzel
    wl-clipboard
    nil
    nixd
    nixfmt
    opencode
  ];
}
