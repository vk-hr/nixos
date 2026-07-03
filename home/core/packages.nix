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
      nvtopPackages.intel
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
      dive
      pureref
    ]
    ++ [ inputs.agenix.packages.x86_64-linux.default ];
}
