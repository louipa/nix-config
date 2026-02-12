{
  home.file = {
    ".config/starship.toml".source = ../dotfiles/starship.toml;

    "bin/autorotate.sh" = {
      source = ../dotfiles/autorotate.sh;
      executable = true;
    };
  };
}
