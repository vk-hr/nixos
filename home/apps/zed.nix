{ font, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "html"
      "just"
      "matte-black"
      "nix"
    ];
    userSettings = {
      agent.default_model = {
        provider = "zed.dev";
        model = "gpt-5.5";
        enable_thinking = true;
        effort = "medium";
      };
      buffer_font_family = font.mono;
      terminal.font_family = "${font.mono} Mono";
      project_panel.dock = "left";
      cli_default_open_behavior = "existing_window";
      icon_theme = {
        mode = "system";
        light = "Zed (Default)";
        dark = "Zed (Default)";
      };
      session.trust_all_workspaces = true;
      vim_mode = true;
      ui_font_size = 16;
      buffer_font_size = 15;
      theme = {
        mode = "system";
        light = "Ayu Light";
        dark = "Matte Black";
      };
    };
  };
}
