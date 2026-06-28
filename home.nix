{ config, pkgs, ... }:

let
	persistDir = "/persist/home/${config.home.username}";
in
{
	home.username = "empty";
	home.homeDirectory = "/home/empty";
	home.stateVersion = "26.05";	

	programs.home-manager.enable = true;

	programs.git = {
		enable = true;
		settings.user = {
			name = "vk-hr";
			email = "viktor.harhatt@gmail.com";
			push = { autoSetupRemote = true; };
			pull = { rebase = false; };
			init = { defaultBranch = "main"; };
			core = { editor = "nvim"; };
		};
	};

	programs.ssh = {
		enable = true;
		addKeysToAgent = "yes";
		matchBlocks = {
			"github.com" = {
				identityFile = "${persistDir}/.ssh/id_github";
				extraOptions = {
					StrictHostKeyChecking = "accept-new";
				};
			};
		};
	};

	home.activation.sshPermitions = config.lib.dag.entryAfter ["writeBoundary"] ''
		mkdir -p ${persistDir}/.ssh
		chmod 700 ${persistDir}/.ssh
	'';

	home.packages = with pkgs; [
		git
		neovim
		htop
		fzf
	];
}
