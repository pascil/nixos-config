{pkgs, ...}: {
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.apple-cursor;
    name = "Apple-Cursor";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.arc-theme;
      name = "arc-theme";
    };
    iconTheme = {
      package = pkgs.arc-icon-theme;
      name = "Arc-Icon-Theme";
    };

    font = {
      name = "Sans";
      size = 12;
    };
  };

  /*
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
     name = "arc-kde-theme";
     package = pkgs.arc-kde-theme;
    };
  };
  */
}
