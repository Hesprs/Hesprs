{ ... }:

{
  # networking
  networking = {
    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      wifi.scanRandMacAddress = false;
      wifi.powersave = true;
    };
  };
  services.resolved.enable = true;
  networking.proxy = {
    httpProxy = "http://127.0.0.1:10808";
    httpsProxy = "http://127.0.0.1:10808";
  };

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  services.pulseaudio.enable = false;

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
  services.printing.enable = true;
}