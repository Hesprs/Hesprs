{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    theme = ./styles.rasi;
    extraConfig = {
      modi = [
        "drun"
        "filebrowser"
        "window"
        "run"
      ];
      font = "Fira Sans 11";
      show-icons = true;
      display-drun = " ";
      display-run = " ";
      display-filebrowser = "";
      display-window = "";
      drun-display-format = "{name}";
      hover-select = false;
      scroll-method = 1;
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      window-format = "{w} · {c} · {t}";
    };
  };
  home.file.".config/rofi/styles.rasi".source = ./styles.rasi;
}
