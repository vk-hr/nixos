{
  pkgs,
  ...
}:

{
  programs.nushell = {
    enable = true;

    extraEnv = ''
      $env.CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense"
      mkdir ~/.cache/carapace
      carapace _carapace | save --force ~/.cache/carapace/init.nu
    '';

    extraConfig = ''
      source ~/.cache/carapace/init.nu

      mkdir ~/.cache/starship
      starship init nushell | save --force ~/.cache/starship/init.nu
      source ~/.cache/starship/init.nu
    '';
  };
}
