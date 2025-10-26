{ lib, config, pkgs, ... }:

{
  imports = [
    ./waybar
    ./swaync
    ./hyprland
    ./hyprpaper
    ./colours
    ./gtk.nix
    ./git.nix
    ./rofi.nix
    ./kitty.nix
    ./dconf.nix
  ];

  programs.home-manager.enable = true;
  services.dunst.enable = true;

  home = {
    username = "hesprs";
    homeDirectory = "/home/hesprs";
    stateVersion = "25.05";
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic"; 
      size = 24;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
