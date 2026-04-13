{ pkgs, lib, ... }:
{
  home.file =
    {
      ".config/starship.toml".source = ../dotfiles/starship.toml;
    }
    // lib.optionalAttrs pkgs.stdenv.isLinux {
      "bin/autorotate.sh" = {
        source = ../dotfiles/autorotate.sh;
        executable = true;
      };
    };
}
