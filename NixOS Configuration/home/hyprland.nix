{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true; # Enable the Hyprland Home Manager module
    systemd.variables = [ "--all" ];

    settings = {
      # Custom variables (no direct equivalent, defined as Nix variables)
      # You can use these Nix variables in other parts of your home-manager config
      # For use within the settings block, you should embed them in string interpolations.
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$browser" = "firefox";
      "$menu" = "rofi -show drun";
      "$mainMod" = "SUPER";

      # ##################
      # ### MONITORS ###
      # ##################
      monitor = [
        ",preferred,auto,1.0"
      ];

      # ###############
      # ### AUTOSTART ###
      # ###############
      exec-once = [
        "v2rayN"
      ];

      # #############################
      # ### ENVIRONMENT VARIABLES ###
      # #############################
      # env = [
        #"XCURSOR_SIZE,24"
        #"HYPRCURSOR_SIZE,24"
        # Note: If you configure cursors with home.pointerCursor,
        # you might not need the XCURSOR_SIZE env var.
      #];

      # #####################
      # ### LOOK AND FEEL ###
      # #####################

      # general
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 1;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # decoration
      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "true";
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # dwindle
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # master
      master = {
        new_status = "master";
      };

      # misc
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      # #############
      # ### INPUT ###
      # #############
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      # ###################
      # ### KEYBINDINGS ###
      # ###################
      # Use ${terminal}, ${fileManager}, etc. variables defined above
      bind = [
        # Basic binds
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, B, exec, $browser"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, F, fullscreen,"

        # Move focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Volume and Brightness (using bindel for continuous action)
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      # Bindl (requires playerctl)
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Bindm (mouse binds)
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Gestures
      gesture = [
        "3, horizontal, workspace"
        "3, up, dispatcher, exec, wtype -k Escape"
        "3, down, dispatcher, exec, $menu"
      ];

      # ##############################
      # ### WINDOWS AND WORKSPACES ###
      # ##############################

      # windowrule
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,screen:0,pinned:0"
        # The commented workspace rules are also 'windowrule' or 'workspace'
        # "bordersize 0, floating:0, onworkspace:w[tv1]"
        # "rounding 0, floating:0, onworkspace:w[tv1]"
        # "bordersize 0, floating:0, onworkspace:f[1]"
        # "rounding 0, floating:0, onworkspace:f[1]"
      ];
      
      # workspace rules (using a list of strings)
      # workspace = [
      #   "w[tv1], gapsout:0, gapsin:0"
      #   "f[1], gapsout:0, gapsin:0"
      # ];
    };
  };
}