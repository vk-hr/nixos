{
  home.persistence."/persist" = {
    enable = true;
    directories = [
      ".ssh"
      ".config/age"
      ".config/nushell"
      ".local/share/nushell"
      "rogram"
    ];
    files = [ ".bash_history" ];
  };
}
