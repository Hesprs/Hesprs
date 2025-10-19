{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    ./waybar
    ./gtk.nix
    ./hyprland.nix
    ./git.nix
    ./rofi.nix
    ./kitty.nix
    ./dconf.nix
  ];

  nixpkgs = {
    overlays = [
      # You can add overlays here
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  programs.home-manager.enable = true;
  services.dunst.enable = true;

  home = {
    username = "hesprs";
    homeDirectory = "/home/hesprs";
    stateVersion = "25.05";
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true; 
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic"; 
      size = 18;
    };
  };

  xdg = {
    enable = true;  # Required for XDG spec compliance
    userDirs.enable = false;  # Disables XDG user dirs (Documents, etc.)
    mime.enable = false;      # Disables MIME database
    extraAutoStart = ''
      X-GNOME-Autostart-enabled=false
    '';
  };

  services.dbus.packages = with pkgs; [];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
