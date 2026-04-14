{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };
    casks = [
      "docker"
      "ghostty"
      "claude"
      "claude-code"
      "cursor"
      "command-x"
      "bruno"
    ];
  };
}
