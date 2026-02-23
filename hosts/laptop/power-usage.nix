{ pkgs, ... }:
{

  # Disable power management for auto-cpufreq
  services.power-profiles-daemon.enable = false;

  powerManagement.powertop.enable = true;
  services.thermald.enable = true;

  programs.auto-cpufreq.enable = true;
  programs.auto-cpufreq.settings = {
    battery = {
      ideapad_laptop_conservation_mode = true;
      governor = "powersave";
      turbo = "never";
      energy_performance_preference = "power";
      # enable_thresholds = true;
      # start_threshold = 20;
      # stop_threshold = 80;
      # scaling_max_freq = 2200000;
    };
    charger = {
      governor = "powersave";
      turbo = "never";
      energy_performance_preference = "balance_power";
    };
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", TEST=="power/wakeup", ATTR{power/wakeup}="disabled"
  '';

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    libva-vdpau-driver
    libvdpau-va-gl
  ];

  boot.kernel.sysctl = {
    "vm.dirty_ratio" = 10;
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_writeback_centisecs" = 500;
    "vm.dirty_expire_centisecs" = 1500;
    "vm.swappiness" = 60;
  };

}
