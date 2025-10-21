{ pkgs, ... }:

{
  imports = [
    ./animations.nix
    ./decoration.nix
    ./rules.nix
    ./bind.nix
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
        "col.active_border" = "rgba(66667066)";
        "col.inactive_border" = "rgba(66667066)";
        resize_on_border = false;
        layout = "dwindle";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      binds = {
        workspace_back_and_forth = false;
        allow_workspace_cycles = true;
        pass_mouse_when_bound = false;
      };

      # misc
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        initial_workspace_tracking = 1;
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
    };
  };
}
