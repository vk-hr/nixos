{
  osConfig ? null,
  ...
}:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };
      "github.com" = {
        IdentityFile =
          if osConfig != null then osConfig.age.secrets.ssh-github.path else "/run/agenix/ssh-github";
        StrictHostKeyChecking = "accept-new";
      };
    };
  };
}
