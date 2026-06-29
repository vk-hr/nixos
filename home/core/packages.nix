{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    neovim
    htop
    fzf
    foot
    zed-editor
    fuzzel
    wl-clipboard
    nil
    nixd
    nixfmt-rfc-style
    opencode
  ];
}
