{
  pkgs,
  ...
}:

{
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;

    firmware = with pkgs; [
      alsa-firmware
      sof-firmware
    ];

    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        vpl-gpu-rt
        intel-compute-runtime
      ];
    };
  };

  services.xserver.videoDrivers = [ "modesetting" ];
}
