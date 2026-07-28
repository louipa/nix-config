{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.zsh pkgs.starship ];

  programs.zsh.enable = true;
}
