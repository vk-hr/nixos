{ ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = false;
    documents = "$HOME/rogram/materials";
    download = "$HOME/rogram/downloads";
    pictures = "$HOME/rogram/pictures";
    videos = "$HOME/rogram/videos";
    music = "$HOME/rogram/music";
    publicShare = "$HOME/rogram";
    templates = "$HOME/rogram";
  };

  systemd.user.tmpfiles.rules = [
    "d %h/rogram 0755"
    "d %h/rogram/workon 0755"
    "d %h/rogram/materials 0755"
    "d %h/rogram/pictures 0755"
    "d %h/rogram/videos 0755"
    "d %h/rogram/downloads 0755"
    "d %h/rogram/study 0755"
    "d %h/rogram/music 0755"
  ];
}
