{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    theme = "~/.config/rofi/styles.rasi";
    extraConfig = {
      # The 'modi' option is a list of strings in Nix
      modi = [
        "drun"
        "filebrowser"
        "window"
        "run"
      ];
      font = "Fira Sans 11";
      show-icons = true;

      # Display names for the modes
      display-drun = " ";
      display-run = " ";
      display-filebrowser = "";
      display-window = "";

      drun-display-format = "{name}";

      # Booleans are Nix booleans
      hover-select = false;

      # Numbers are Nix integers
      scroll-method = 1;

      # The me-select-entry and me-accept-entry options
      me-select-entry = "";
      me-accept-entry = "MousePrimary";

      window-format = "{w} · {c} · {t}";
    };
  };
  home.file.".config/rofi/styles.rasi".source = ./styles.rasi;
}
