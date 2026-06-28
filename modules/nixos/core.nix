{}:

{
	boot.loader.systemd-boot.enable = true;
  	boot.loader.efi.canTouchEfiVariables = true;

  	boot.kernelPackages = pkgs.linuxPackages_latest;

  	nix.settings.experimental-features = [ "nix-command" "flakes" ];


	time.timeZone = "Europe/Kyiv";
	i18n.defaultLocale = "en_US.UTF-8";

	users.users.empty = {
	    isNormalUser = true;
	    extraGroups = [ "wheel" "networkmanager" ]; 
	};

	security.sudo.wheelNeedsPassword = true;
  
  	environment.systemPackages = with pkgs; [
    		vim
    		wget
  	];

}
