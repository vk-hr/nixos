{ config, ... }:

{
  age = {
    identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets.ssh-github = {
      file = ../../secrets/ssh-github.age;
      owner = "empty";
      group = "users";
      mode = "600";
    };
  };
}
