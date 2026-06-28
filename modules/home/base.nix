{ inputs, config, ... }:

let
  persistDir = "/persist/home/${config.home.username}";
in

{
  imports = [ inputs.helium.homeModules.default ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "vk-hr";
        email = "viktor.harhatt@gmail.com";
      };
      push = {
        autoSetupRemote = true;
      };
      pull = {
        rebase = false;
      };
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "nvim";
      };
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };
      "github.com" = {
        IdentityFile = "${persistDir}/.ssh/id_github";
        StrictHostKeyChecking = "accept-new";
      };
    };
  };

  programs.helium = {
    enable = true;
    flags = [
      "--ozone-platform=wayland"
      "--enable-features=WaylandWindowDecorations"
      "--disable-component-update"
      "--check-for-updates-interval=0"
      "--disable-background-networking"
    ];
  };
}
