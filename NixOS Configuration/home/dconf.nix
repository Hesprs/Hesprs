{ ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "system/proxy" = {
        mode = "none";  # Critical: disables system proxy detection
        use-same-proxy = false;
        # Explicitly clear all protocol-specific settings
        http-host = "";
        http-port = 0;
        https-host = "";
        https-port = 0;
        ftp-host = "";
        ftp-port = 0;
        socks-host = "";
        socks-port = 0;
      };
    };
  };
}