{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    # Decoration Block
    decoration = {
      rounding = 12;
      active_opacity = 1.0;
      inactive_opacity = 0.9;
      fullscreen_opacity = 1.0;

      blur = {
        enabled = true;
        size = 3;
        passes = 4;
        new_optimizations = "on";
        ignore_opacity = true;
        xray = true;
      };

      shadow = {
        enabled = true;
        range = 10;
        render_power = 2;
        color = "0x33000000"; # Hex color codes must be strings
      };
    };

    # Top-level Layer Rule
    # Multiple rules are specified as a list of strings
    layerrule = [ "blur, waybar" ];
  };
}