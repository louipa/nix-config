{ inputs, pkgs, ... }:
{

  # Disable power management for auto-cpufreq
  services.power-profiles-daemon.enable = false;

  programs.auto-cpufreq.enable = true;
  programs.auto-cpufreq.settings = {
    battery = {
      ideapad_laptop_conservation_mode = true;
    };
  };
}
