{ pkgs, ... }:

{
  imports = [
    ./animations.nix
    ./decoration.nix
    ./windowRule.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true; # Enable the Hyprland Home Manager module
    systemd.variables = [ "--all" ];
    xwayland.enable = true;

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
      env = [
        #"XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,16"
        # Note: If you configure cursors with home.pointerCursor,
        # you might not need the XCURSOR_SIZE env var.
      ];

      # #####################
      # ### LOOK AND FEEL ###
      # #####################

      # general
      general = {
        gaps_in = 6;
        gaps_out = 12;
        border_size = 1;
        "col.active_border" = "rgba(59595999)";
        "col.inactive_border" = "rgba(59595999)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
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
        "$mainMod, E, exec, $fileManager -w"
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
      
      # workspace rules (using a list of strings)
      # workspace = [
      #   "w[tv1], gapsout:0, gapsin:0"
      #   "f[1], gapsout:0, gapsin:0"
      # ];
    };
  };
}