{ username, ... }:

{
  preservation = {
    enable = true;

    preserveAt."/persist" = {
      directories = [
        "/var/lib/NetworkManager"
        "/etc/NetworkManager/system-connections"
        "/var/lib/bluetooth"
        "/var/lib/systemd"
        "/var/lib/nixos"
        "/var/lib/flatpak"
        "/var/lib/libvirt"
        "/var/lib/docker"
        "/var/lib/sbctl"
        "/var/log"
      ];

      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
      ];

      users.${username}.directories = [
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
        ".config/nushell"
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
    "/home/${username}/.local".d = {
      user = username;
      group = "users";
      mode = "0755";
    };
    "/home/${username}/.local/share".d = {
      user = username;
      group = "users";
      mode = "0755";
    };
    "/home/${username}/.local/state".d = {
      user = username;
      group = "users";
      mode = "0755";
    };
    "/home/${username}/.cache".d = {
      user = username;
      group = "users";
      mode = "0755";
    };
  };

  systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
}
