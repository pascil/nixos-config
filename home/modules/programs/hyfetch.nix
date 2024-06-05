{
  config,
  pkgs,
  ...
}: {
  programs.hyfetch.settings = {
    preset = "aromantic";
    mode = "rgb";
    light_dark = "dark";
    lightness = 0.65;
    color_align = {
      mode = "horizontal";
      custom_colors = [];
      fore_back = null;
    };

    backend = "neofetch";
    distro = null;
    pride_month_shown = [];
    pride_month_disable = false;
  };
}
