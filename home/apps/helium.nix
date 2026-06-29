{ inputs, ... }:

{
  imports = [ inputs.helium.homeModules.default ];

  programs.helium = {
    enable = true;
    flags = [
      "--ozone-platform=wayland"
      "--enable-features=WaylandWindowDecorations"
      "--disable-component-update"
      "--check-for-updates-interval=0"
      "--disable-background-networking"
    ];
  };
}
