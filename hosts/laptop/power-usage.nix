{ inputs, pkgs, ... }:
{

  # Disable power management for auto-cpufreq
  services.power-profiles-daemon.enable = false;

  powerManagement.powertop.enable = true;

  programs.auto-cpufreq.enable = true;
  programs.auto-cpufreq.settings = {
    battery = {
      ideapad_laptop_conservation_mode = true;
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
}
