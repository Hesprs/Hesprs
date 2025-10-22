{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.whitesur-gtk-theme;
      name = "White-Sur-GTK";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "SF Display";
      size = 11;
    };
  };
}