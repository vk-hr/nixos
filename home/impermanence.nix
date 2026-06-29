{
  home.persistence."/persist" = {
    enable = true;
    directories = [
      ".ssh"
      ".config/age"
      "Documents"
      "Downloads"
      "Pictures"
      "Videos"
      "Music"
    ];
    files = [ ".bash_history" ];
  };
}
