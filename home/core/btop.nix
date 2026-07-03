{ colors, ... }:

let
  start = colors.palette."8";
  mid = colors.palette."12";
  end = colors.palette."3";
in
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "default";
      theme_background = false;
      update_ms = 1000;
      vim_keys = true;
      show_disks = false;
      proc_tree = true;
    };
    themes.default = ''
      theme[main_bg]=""
      theme[main_fg]="${colors.palette."14"}"
      theme[title]="${start}"
      theme[hi_fg]="${mid}"
      theme[selected_bg]="${mid}"
      theme[selected_fg]="${colors.palette."14"}"
      theme[inactive_fg]="${colors.palette."0"}"
      theme[proc_misc]="${start}"
      theme[cpu_box]="${start}"
      theme[mem_box]="${start}"
      theme[net_box]="${start}"
      theme[proc_box]="${start}"
      theme[div_line]="${start}"
      theme[temp_start]="${start}"
      theme[temp_mid]="${mid}"
      theme[temp_end]="${end}"
      theme[cpu_start]="${start}"
      theme[cpu_mid]="${mid}"
      theme[cpu_end]="${end}"
      theme[free_start]="${start}"
      theme[free_mid]="${mid}"
      theme[free_end]="${end}"
      theme[cached_start]="${start}"
      theme[cached_mid]="${mid}"
      theme[cached_end]="${end}"
      theme[available_start]="${start}"
      theme[available_mid]="${mid}"
      theme[available_end]="${end}"
      theme[used_start]="${start}"
      theme[used_mid]="${mid}"
      theme[used_end]="${end}"
      theme[download_start]="${start}"
      theme[download_mid]="${mid}"
      theme[download_end]="${end}"
      theme[upload_start]="${start}"
      theme[upload_mid]="${mid}"
      theme[upload_end]="${end}"
    '';
  };
}
