{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };
      "github.com" = {
        IdentityFile = "/run/agenix/ssh-github";
        StrictHostKeyChecking = "accept-new";
      };
    };
  };
}
