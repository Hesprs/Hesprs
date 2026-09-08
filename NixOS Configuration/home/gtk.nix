{ pkgs, ... }:

let
  theme = {
    package = pkgs.mactahoe-gtk-theme;
    name = "MacTahoe-Dark-Blur";
  };
in
{
  stylix.targets.gtk.enable = false;

  gtk = {
    enable = true;
    inherit theme;
    gtk3 = {
      theme = theme;
      extraConfig.gtk-decoration-layout = "menu:";
    };
    gtk4.theme = theme;
    colorScheme = "dark";
  };
}
