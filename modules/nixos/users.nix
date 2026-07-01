{
  pkgs,
  ...
}:

{
  users.users.empty = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
