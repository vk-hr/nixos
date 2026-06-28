{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		git
		neovim
		htop
		fzf
	];
}
