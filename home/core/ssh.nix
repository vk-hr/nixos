{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };
      "github.com" = {
        IdentityFile = "/run/secrets/ssh-github";
        StrictHostKeyChecking = "accept-new";
      };
    };
  };
}
