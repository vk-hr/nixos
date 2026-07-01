{
  pkgs,
  inputs,
  ...
}:

{
  home.packages =
    with pkgs;
    [
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
      just
      nvd
    ]
    ++ [ inputs.agenix.packages.x86_64-linux.default ];
}
