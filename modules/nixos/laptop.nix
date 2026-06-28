{ config, pkgs, ... }:

{
	hardware.enableAllFirmware = true;

	networking.networkManager.enable = true;

	services.power-profiles-daemon.enable = true;

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
}
