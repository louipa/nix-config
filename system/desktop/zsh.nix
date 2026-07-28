{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.zsh pkgs.fastfetch ];

  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;
}
