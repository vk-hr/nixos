{ config, pkgs, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;

    extraPackages = with pkgs; [
      poppler-utils
      ffmpegthumbnailer
      unzip
      jq
      imagemagick
      fd
      ouch
    ];

    plugins = {
      ouch = pkgs.yaziPlugins.ouch;
      office = pkgs.yaziPlugins.office;
    };

    settings = {
      manager = {
        ratio = [
          1
          3
          4
        ];
        show_hidden = false;
        sort_by = "alphabetical";
        sort_dir_first = true;
      };
      plugin.prepend_previewers = [
        {
          mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
          run = "ouch";
        }
      ];
      opener.extract = [
        {
          run = ''ouch d -y "$@"'';
          desc = "Extract here";
          for = "unix";
        }
      ];
    };

    keymap.mgr.prepend_keymap = [
      {
        on = [ "C" ];
        run = "plugin ouch";
        desc = "Compress with ouch";
      }
    ];

    theme.manager = {
      cwd.fg = colors.base0D;
      hovered = {
        bg = colors.base02;
        fg = colors.base05;
      };
      border_style.fg = colors.base03;
    };
  };
}
