{
  console.useXkbConfig = true;
  services.xserver.xkb = {
    layout = "us,ua";
    options = "grp:caps_toggle,caps:shift";
  };
}
