{
  config,
  pkgs,
  lib,
  ...
}:

{
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      name = "SF Pro Display";
      size = 12;
    };
  };
}
