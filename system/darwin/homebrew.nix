{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };


    brews = [
      "skillshare"
    ];

    casks = [
      "docker"
      "ghostty"
      "claude"
      "claude-code"
      "cursor"
      "command-x"
      "bruno"
      "gcc-arm-embedded"
    ];
  };
}
