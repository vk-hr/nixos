{ config, ... }:
let
  persistDir = "/persist/home/${config.home.username}";
in
{
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
}
