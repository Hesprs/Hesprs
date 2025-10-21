{ ... }:

{
  wayland.windowManager.hyprland.settings.windowrule = [
    # Standard App Rules
    "tile, title:^(Microsoft-edge)$"
    "tile, title:^(Brave-browser)$"
    "tile, title:^(Chromium)$"
    "float, title:^(pavucontrol)$"
    "float, title:^(blueman-manager)$"
    "float, title:^(nm-connection-editor)$"
    "float, title:^(qalculate-gtk)$"

    # Browser Picture in Picture Rules
    "float, title:^(Picture-in-Picture)$"
    "pin, title:^(Picture-in-Picture)$"
    "move 69.5% 4%, title:^(Picture-in-Picture)$"

    # idleinhibit Rule
    "idleinhibit fullscreen,class:([window])"

    # XWayland Rules
    # Rule to prevent large border when moving objects in Resolve
    "noblur, class:^(\\bresolve\\b)$, xwayland:1"

    # swaync
    "blur, swaync-control-center"
    "blur, swaync-notification-window"
    "ignorezero, swaync-control-center"
    "ignorezero, swaync-notification-window"
    "ignorealpha 0.5, swaync-control-center"
    "ignorealpha 0.5, swaync-notification-window"

    # Waybar
    "blur, waybar"
    "ignorezero, waybar"
    "ignorealpha 0.5, waybar"
  ];
}