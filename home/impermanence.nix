{
  home.persistence."/persist" = {
    enable = true;
    directories = [
      ".ssh"
      ".config/age"
      ".config/nushell"
      ".local/share/nushell"
      ".var/app"
      "rogram"
    ];
    files = [ ".bash_history" ];
  };
}
