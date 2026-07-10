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
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      diff.algorithm = "histogram";
      merge.conflictstyle = "diff3";
    };
  };
}
