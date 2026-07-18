{ username, ... }:

{
  preservation = {
    enable = true;

    preserveAt."/persist" = {
      directories = [
        "/etc/ssh"
        "/var/lib/bluetooth"
        "/var/lib/boltd"
        "/var/lib/cups"
        "/var/lib/docker"
        "/var/lib/flatpak"
        "/var/lib/iwd"
        "/var/lib/libvirt"
        "/var/lib/nixos"
        "/var/lib/sbctl"
        "/var/lib/systemd/backlight"
        "/var/lib/systemd/timesync"
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
        ".bun"
        ".cache/ccache"
        ".cargo"
        ".config/age"
        ".config/blender"
        ".config/discord"
        ".config/gh"
        ".config/libreoffice"
        ".config/net.imput.helium"
        ".config/nushell"
        ".config/opencode"
        ".local/share/Steam"
        ".local/share/direnv"
        ".local/share/keyrings"
        ".local/share/nvim"
        ".local/share/opencode"
        ".local/share/telegram-desktop"
        ".local/share/uv"
        ".local/share/zed"
        ".local/share/zoxide"
        ".local/state/opencode"
        ".local/state/wireplumber"
        ".var/app"
        "go"
        "nixos"
        "rogram"
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
