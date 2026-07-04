{ inputs, ... }:

{
  imports = [ inputs.helium.homeModules.default ];

  programs.helium = {
    enable = true;
    flags = [
      "--ozone-platform=wayland"
      "--enable-features=WaylandWindowDecorations"
      "--enable-features=UseOzonePlatform"
      "--enable-features=WebRTCPipeWireCapturer"
      "--disable-component-update"
      "--check-for-updates-interval=0"
      "--disable-background-networking"
    ];
  };
}
