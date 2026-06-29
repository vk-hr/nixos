{
  home.persistence."/persist" = {
    enable = true;
    directories = [
      "home/empty/.ssh"
      "home/empty/Documents"
      "home/empty/Downloads"
      "home/empty/Pictures"
      "home/empty/Videos"
      "home/empty/Music"
    ];
    files = [
      "home/empty/.bash_history"
    ];
  };
}
