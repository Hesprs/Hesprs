{
  lib,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./desktop.nix
    ./hardware.nix
    ./greetd.nix
  ];

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;
    gc = {
      automatic = true;
      options = "--delete-older-than 4d";
    };
    optimise.automatic = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Libertas";
  networking.networkmanager.enable = true;

  # Localization
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  users.users = {
    hesprs = {
      isNormalUser = true;
      description = "Hēsperus";
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };

  # services
  programs.firefox.enable = true;
  security.rtkit.enable = true;
  services.flatpak.enable = true;
  programs.dconf.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "hyprland"
          "gtk"
        ];
      };
    };
  };

  nixpkgs = {
    overlays = [
      (import ./codium)
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (pkg: true);
    };
  };

  #packages
  environment.systemPackages = with pkgs; [
    thunderbird
    obsidian
    python3
    codium
    wtype
    v2rayn
    nodePackages_latest.nodejs
    pnpm
    bak2.qq

    nixfmt-rfc-style
    hyprpaper
    pywal
    yay
  ];
  # | -------------- Flatpak APPs -------------- |
  # | flatpak install com.tencent.wemeet         |

  fonts.packages = with pkgs; [
    (pkgs.callPackage ./fonts/SFMono {})
    nerd-fonts.fira-code
  ];

  networking.proxy = {
    httpProxy = "http://127.0.0.1:10808";
    httpsProxy = "http://127.0.0.1:10808";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.05";
}
