{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    # Decoration Block
    decoration = {
      rounding = 12;
      active_opacity = 0.93;
      inactive_opacity = 0.88;
      fullscreen_opacity = 0.93;
      dim_inactive = true;
      dim_strength = 0.1;

      blur = {
        enabled = true;
        size = 3;
        passes = 4;
        vibrancy = 0.3;
        ignore_opacity = true;
        xray = true;
        noise = 0.08;
        popups = true;
      };

      shadow = {
        enabled = true;
        range = 12;
        render_power = 2;
        color = "rgba(0, 0, 0, 0.2)";
        color_inactive = "rgba(0, 0, 0, 0.12)";
      };
    };

    # Top-level Layer Rule
    # Multiple rules are specified as a list of strings
    layerrule = [ "blur, waybar" ];
  };
}