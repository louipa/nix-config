{ ... }:
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
      scaling_max_freq = 2200000; # 2.2 GHz cap
    };
    charger = {
      governor = "powersave";
      turbo = "never";
      energy_performance_preference = "balance_power";
    };
  };
}
