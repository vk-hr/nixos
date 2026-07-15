{ username, ... }:

{
  preservation = {
    enable = true;

    preserveAt."/persist" = {
      directories = [
        "/var/lib/NetworkManager"
        "/etc/NetworkManager/system-connections"
        "/var/lib/bluetooth"
        "/var/lib/systemd/backlight"
        "/var/lib/systemd/timesync"
        "/var/lib/nixos"
        "/var/lib/flatpak"
        "/var/lib/libvirt"
        "/var/lib/docker"
        "/var/lib/sbctl"
        "/var/lib/cups"
        "/var/lib/boltd"
        "/etc/ssh"
        "/var/log"
      ];

      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
        {
          file = "/var/lib/systemd/random-seed";
          mode = "0600";
        }
        {
          file = "/var/lib/systemd/credential.secret";
          mode = "0400";
        }
      ];

      users.${username}.directories = [
        {
          directory = ".ssh";
          mode = "0700";
        }
        ".config/age"
        ".config/gh"
        ".config/opencode"
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
        ".local/share/direnv"
        ".local/share/opencode"
        ".local/share/zoxide"
        ".local/state/opencode"
        ".local/state/wireplumber"
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
