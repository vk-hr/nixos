{ config, pkgs, ... }:

{
	home.username = "empty";
	home.homeDirectory = "/home/empty";
	home.stateVersion = "26.05";	

	programs.home-manager.enable = true;
	
	imports = [
		./modules/home/base.nix
		./modules/home/packages.nix
	];
}
