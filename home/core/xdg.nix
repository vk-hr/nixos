{ pkgs, ... }:

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

  xdg.configFile."xdg-desktop-portal-termfilechooser/config".text = ''
    [filechooser]
    cmd = ${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
    default_dir = $HOME
    env = TERMCMD='ghostty -e'
    env = PATH=$PATH:/run/current-system/sw/bin:/etc/profiles/per-user/empty/bin
    open_mode = suggested
    save_mode = last
  '';
}
