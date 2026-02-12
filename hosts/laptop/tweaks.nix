{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # https://www.reddit.com/r/Fedora/comments/1n7lyno/lenovo_yoga_pro_7_14asp10_sound_issue/
  environment.etc."modprobe.d/alc287.conf".text = ''
    options snd-hda-intel model=(null),alc287-yoga9-bass-spk-pin
  '';

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
