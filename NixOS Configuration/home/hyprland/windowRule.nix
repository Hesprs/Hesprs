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
  ];
}