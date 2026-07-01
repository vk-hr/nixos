{
  home.persistence."/persist" = {
    enable = true;
    directories = [
      ".ssh"
      ".config/age"
      ".config/nushell"
      ".local/share/nushell"
      "Documents"
      "Downloads"
      "Pictures"
      "Videos"
      "Music"
    ];
    files = [ ".bash_history" ];
  };
}
