_:

{
  programs.nushell = {
    enable = true;

    environmentVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      STARSHIP_SHELL = "nu";
    };

    settings = {
      show_banner = false;
      edit_mode = "vi";
      cursor_shape = {
        emacs = "line";
        vi_insert = "line";
        vi_normal = "block";
      };
      history = {
        max_size = 100000;
        file_format = "sqlite";
        sync_on_enter = true;
      };
      rm.always_trash = true;
      error_style = "fancy";
      use_kitty_protocol = true;
      render_right_prompt_on_last_line = true;
      footer_mode = 25;
      table.mode = "compact";
      ls = {
        use_ls_colors = true;
        clickable_links = true;
      };
      completions = {
        external.enable = true;
        quick = true;
        partial = true;
      };
      shell_integration = {
        osc2 = true;
        osc7 = true;
        osc8 = true;
      };
    };

    extraConfig = ''
      def create_left_prompt [] {
        starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
      }
      $env.PROMPT_COMMAND = {|| create_left_prompt }
      $env.PROMPT_COMMAND_RIGHT = ""
      $env.PROMPT_INDICATOR = ""
      $env.PROMPT_INDICATOR_VI_INSERT = ": "
      $env.PROMPT_INDICATOR_VI_NORMAL = "〉"
      $env.PROMPT_MULTILINE_INDICATOR = "::: "
    '';
  };
}
