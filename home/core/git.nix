{
  programs.git = {
    enable = true;

    settings = {
      user.name = "vk-hr";
      user.email = "viktor.harhatt@gmail.com";
      push.autoSetupRemote = true;
      pull.rebase = false;
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
