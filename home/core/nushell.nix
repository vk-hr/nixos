{
  programs.nushell = {
    enable = true;

    extraConfig = ''
      $env.config.show_banner = false
      $env.PROMPT_COMMAND = {|| starship prompt }
      $env.PROMPT_INDICATOR = ""
    '';
  };
}
