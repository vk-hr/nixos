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
      curl
      tree
      ncdu
      bat
      ffmpeg
      brightnessctl
      mpv
      imv
      telegram-desktop
      discord
      libreoffice
      blender
    ]
    ++ [ inputs.agenix.packages.x86_64-linux.default ];
}
