{
  home.persistence."/persist/home" = {
    enable = true;
    directories = [
      "empty/.ssh"
      "empty/.config/age"
      "empty/Documents"
      "empty/Downloads"
      "empty/Pictures"
      "empty/Videos"
      "empty/Music"
    ];
    files = [ "empty/.bash_history" ];
  };
}
