{ username, ... }:

{
  age = {
    identityPaths = [ "/persist/home/${username}/.config/age/age.key" ];
    secrets.ssh-github = {
      file = ../../../secrets/ssh-github.age;
      owner = username;
      group = "users";
      mode = "600";
    };
  };
}
