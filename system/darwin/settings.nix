{ ... }:
{
  system.defaults = {
    dock = {
      autohide = true;
      orientation = "bottom";
      show-recents = false;
      mru-spaces = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleKeyboardUIMode = 3;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
    };
    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
