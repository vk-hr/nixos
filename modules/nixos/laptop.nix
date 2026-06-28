{ config, pkgs, ... }:

{
	hardware.enableAllFirmware = true;

	networking.networkmanager.enable = true;

	services.power-profiles-daemon.enable = true;

	hardware = {
		graphics.enable = true;
		bluetooth = {
			enable = true;
			powerOnBoot = true;
		};
	};

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	security.polkit.enable = true;

	services.greetd = {
    		enable = true;
    		settings = {
      			default_session = {
        			command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri";
        			user = "greeter";
			};
    		};
  	};

	programs.niri.enable = true;

  	xdg.portal = {
    		enable = true;
    		extraPortals = with pkgs; [
      			xdg-desktop-portal-wlr
      			xdg-desktop-portal-gtk
    		];
	};
}
