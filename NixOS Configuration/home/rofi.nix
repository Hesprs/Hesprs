{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    # Set the default mode(s) and other basic configuration
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      disable-history = true;
    };
  };
}