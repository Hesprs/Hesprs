{ ... }:

{
  home.file = {
    ".config/hyprpaper/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ./wallpapers/10.png;
      wallpaper = " , ./wallpapers/10.png";
    };
  };
}