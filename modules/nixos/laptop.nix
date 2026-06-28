{ pkgs, ... }: {
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;

  hardware.firmware = with pkgs; [
    alsa-firmware
    sof-firmware
  ];

  hardware.cpu.intel.updateMicrocode = true;

  networking.networkmanager.enable = true;

  services.power-profiles-daemon.enable = false;

  services.logind = {
    settings = {
      Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "suspend";
        HandleLidSwitchDocked = "ignore";
      };
    };
  };

  services.fstrim.enable = true;

  services.hardware.bolt.enable = true;

  services.libinput.enable = true;

  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        vpl-gpu-rt
        intel-compute-runtime
      ];
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
  };

  services.fprintd = {
    enable = true;
  };

  services.xserver.videoDrivers = [ "modesetting" ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  security.polkit.enable = true;

  services.thermald.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri";
        user = "greeter";
      };
    };
  };

  services.tlp = {
    enable = true;
    settings = {
      SUSPEND_NO_LINGER = 1;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    };
  };

  programs.niri.enable = true;
  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
