{ pkgs, ... }:

{
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;

  hardware.firmware = with pkgs; [
    alsa-firmware
    sof-firmware
  ];

  hardware.cpu.intel.updateMicrocode = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vpl-gpu-rt
      intel-compute-runtime
    ];
  };

  services.xserver.videoDrivers = [ "modesetting" ];
}
