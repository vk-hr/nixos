{ font, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "html"
      "just"
      "matte-black"
      "nix"
      "toml"
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

      load_direnv = "direct";

      lsp = {
        gopls.binary.path = "gopls";
        rust-analyzer.binary.path = "rust-analyzer";
        typescript-language-server.binary.path = "typescript-language-server";
        zls.binary.path = "zls";
        pyright.binary.path = "pyrightlangserver";
        clangd.binary.path = "clangd";
      };

      languages = {
        Rust = {
          formatter = "language_server";
          format_on_save = "on";
          tab_size = 4;
        };
        Go = {
          formatter = "language_server";
          format_on_save = "on";
          tab_size = 4;
        };
        TypeScript = {
          formatter.external = {
            command = "biome";
            arguments = [
              "format"
              "--stdin-file-path"
              "{buffer_path}"
            ];
          };
          format_on_save = "on";
          tab_size = 2;
        };
        JavaScript = {
          formatter.external = {
            command = "biome";
            arguments = [
              "format"
              "--stdin-file-path"
              "{buffer_path}"
            ];
          };
          format_on_save = "on";
          tab_size = 2;
        };
        JSON = {
          formatter.external = {
            command = "biome";
            arguments = [
              "format"
              "--stdin-file-path"
              "{buffer_path}"
            ];
          };
          format_on_save = "on";
          tab_size = 2;
        };
        Python = {
          formatter.external = {
            command = "ruff";
            arguments = [
              "format"
              "-"
            ];
          };
          format_on_save = "on";
          tab_size = 4;
        };
      };
    };
  };
}
