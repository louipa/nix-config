{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.sensor.iio.enable = true;

  systemd.user.services.autorotate = {
    description = "Auto-rotate for Lenovo Yoga 2 in 1";
    after = [ "graphical-session.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "simple";
      Restart = "on-failure";
      RestartSec = 5;

      Environment = [
        "DISPLAY=:0"
        "XAUTHORITY=$HOME/.Xauthority"
        "LOG_LEVEL=DEBUG"
        "PATH=/run/current-system/sw/bin:/run/current-user/sw/bin:/usr/bin:/bin"
      ];

      StandardOutput = "journal";
      StandardError = "journal";
    };

    script = ''
      "$HOME/bin/autorotate.sh"
    '';
  };
}
