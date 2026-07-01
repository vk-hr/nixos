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
      fuzzel
      wl-clipboard
      nil
      nixd
      nixfmt
      opencode
      just
      nvd
      carapace
    ]
    ++ [ inputs.agenix.packages.x86_64-linux.default ];
}
