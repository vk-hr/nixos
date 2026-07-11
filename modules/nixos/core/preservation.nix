{ ... }:

{
  preservation = {
    enable = true;

    preserveAt."/persist" = {
      directories = [
        "/var/lib/NetworkManager"
        "/var/lib/bluetooth"
        "/var/lib/systemd"
        "/var/lib/nixos"
        "/var/lib/flatpak"
        "/var/lib/libvirt"
        "/var/lib/docker"
        "/var/log"
      ];

      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
      ];

      users.vkhr.directories = [
        {
          directory = ".ssh";
          mode = "0700";
        }
        ".config/age"
        ".config/gh"
        "rogram"
        "nixos"
        ".local/share/Steam"
        ".var/app"
        ".local/share/telegram-desktop"
        ".config/discord"
        ".config/libreoffice"
        ".config/blender"
        ".config/net.imput.helium"
        ".local/share/nushell"
        ".local/share/direnv"
        ".local/share/zoxide"
        ".cargo"
        "go"
        ".bun"
        ".local/share/uv"
        ".cache/ccache"
        ".local/share/zed"
        ".local/share/nvim"
      ];
    };
  };

  systemd.tmpfiles.settings."10-persist-parents" = {
    "/home/vkhr/.local".d = {
      user = "vkhr";
      group = "users";
      mode = "0755";
    };
    "/home/vkhr/.local/share".d = {
      user = "vkhr";
      group = "users";
      mode = "0755";
    };
    "/home/vkhr/.local/state".d = {
      user = "vkhr";
      group = "users";
      mode = "0755";
    };
    "/home/vkhr/.cache".d = {
      user = "vkhr";
      group = "users";
      mode = "0755";
    };
  };

  systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
}
