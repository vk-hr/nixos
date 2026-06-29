{ config, ... }:

{
  age = {
    identityPaths = [ "/persist/home/empty/.config/age/age.key" ];
    secrets.ssh-github = {
      file = ../../secrets/ssh-github.age;
      owner = "empty";
      group = "users";
      mode = "600";
    };
  };
}
