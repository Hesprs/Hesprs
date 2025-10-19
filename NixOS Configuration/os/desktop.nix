{ config, pkgs, inputs, ... }:

{
  imports = [
    ./greetd.nix
  ];
  # enable the X11 windowing system.
  services.xserver.enable = false;

  # Disable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = false;
  services.desktopManager.gnome.enable = false;

  environment.systemPackages = with pkgs; [
    nautilus                     # file manager
    brightnessctl                # screen brightness control
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  services.gvfs.enable = true;   # nautilus dependency

  hardware.graphics.enable = true;
}
