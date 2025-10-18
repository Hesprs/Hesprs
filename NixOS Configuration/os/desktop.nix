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
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  environment.systemPackages = with pkgs; [
    kitty                        # terminal
    nautilus                     # file manager
    brightnessctl                # screen brightness control
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.gvfs.enable = true;   # nautilus dependency

  hardware.graphics.enable = true;
}
