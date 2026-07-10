{ config, ... }:

{
  age = {
    identityPaths = [ "/persist/home/vkhr/.config/age/age.key" ];
    secrets.ssh-github = {
      file = ../../secrets/ssh-github.age;
      owner = "vkhr";
      group = "users";
      mode = "600";
    };
  };
}
