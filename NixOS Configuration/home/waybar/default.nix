{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      style = builtins.readFile ./style.css;
      main = {
        layer = "top";
        position = "top";
        height = 30;

        # List of modules to show on the left, center, and right
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "clock" "backlight" "pulseaudio" "network" "battery" "tray" ];

        # Module-specific configuration (using WayBar's JSON keys)
        "clock" = {
          format = " {:%H:%M:%S}  {:%Y-%m-%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          interval = 1;
        };
        
        "network" = {
          format-wifi = "  {essid} ({signal_strength}%)";
          format-ethernet = " {ipaddr}/{cidr}";
          format-disconnected = " No network";
          tooltip-format = "{ifname} via {gwaddr}";
        };
        
        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = {
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        # ... add more module configurations here
      };
    };
  };
}