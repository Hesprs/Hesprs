{ ... }:

{
  home.file = {
    "Pictures/Wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["/home/hesprs/Pictures/Wallpapers/10.jpg"];
      wallpaper = [", /home/hesprs/Pictures/Wallpapers/10.jpg"];
    };
  };
}