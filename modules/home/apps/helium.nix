{ inputs, ... }:

{
  imports = [ inputs.helium.homeModules.default ];

  programs.helium = {
    enable = true;
    flags = [
      "--ozone-platform=wayland"
      "--enable-features=UseOzonePlatform,WebRTCPipeWireCapturer,VaapiVideoEncoder"
      "--disable-component-update"
      "--check-for-updates-interval=0"
      "--disable-background-networking"
    ];
  };
}
