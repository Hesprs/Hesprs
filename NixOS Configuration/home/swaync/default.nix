{ config, pkgs, lib, ... }:

{
  services.swaync = {
    enable = true;
    style = builtins.readFile ./styles.css;
    settings = {
      # General Position and Layer
      positionX = "left";
      positionY = "top";
      layer = "overlay";
      cssPriority = "user";

      # Control Center Dimensions and Margins
      control-center-width = 360;
      control-center-height = 560;
      control-center-margin-top = 12;
      control-center-margin-bottom = 12;
      control-center-margin-left = 12;
      control-center-margin-right = 0;

      # Notification Window Settings
      notification-window-width = 300;
      notification-icon-size = 24;
      notification-body-image-height = 100;
      notification-body-image-width = 200;

      # Timeout Settings (in seconds)
      timeout = 4;
      timeout-low = 2;
      timeout-critical = 6;

      # Boolean/Flag Settings
      fit-to-screen = true;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200; # in milliseconds
      hide-on-clear = true;
      hide-on-action = true;
      script-fail-notify = true;

      # Scripts and Visibility
      scripts = {};
      notification-visibility = {
        "example-name" = {
          state = "muted";
          urgency = "Normal";
          app-name = "Spotify";
        };
      };

      # Widgets to Display
      widgets = [
        "dnd"
        "buttons-grid"
        "backlight"
        "volume"
        "mpris"
        "title"
        "notifications"
      ];

      # Widget-Specific Configuration
      widget-config = {
        dnd = {
          text = "Do not Disturb";
        };

        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };

        mpris = {
          image-size = 0;
          image-radius = 0;
        };

        backlight = {
          label = "󰃟"; # Unicode character
        };

        volume = {
          label = ""; # Unicode character
        };

        # Buttons Grid Configuration with commands.
        # Note: Nix strings must escape quotes within commands.
        buttons-grid = {
          actions = [
            # Wi-Fi Toggle
            {
              label = "";
              type = "toggle";
              active = true;
              # Single-quotes around command body in JSON are translated to Nix string escaping
              command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && nmcli radio wifi on || nmcli radio wifi off'";
              update-command = "sh -c '[[ $(nmcli r wifi) == \"enabled\" ]] && echo true || echo false'";
            }
            # Bluetooth Toggle
            {
              label = "";
              type = "toggle";
              active = true;
              command = "rfkill toggle bluetooth";
              update-command = "";
            }
            # Volume Mute Toggle
            {
              label = "󰕾";
              type = "toggle";
              active = true;
              command = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
              update-command = "";
            }
            # Lock Screen Button
            {
              label = "";
              command = "hyprlock";
            }
          ];
        };
      };
    };
  };
}