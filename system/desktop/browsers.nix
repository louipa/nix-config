{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (brave.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
        "--password-store=gnome"
      ];
    })
    nur.repos.forkprince.helium-nightly

    # Vanilla browsers for testing
    firefox
    chromium
    epiphany
  ];

  environment.etc."/brave/policies/managed/GroupPolicy.json".source =
    (pkgs.formats.json { }).generate "brave-managed-policy.json"
      {
        BraveRewardsDisabled = true;
        BraveWalletDisabled = true;
        BraveAIChatEnabled = false;
        AutofillEnabled = false;
        AutofillProfileEnabled = false;
        AutofillCreditCardEnabled = false;
        PasswordManagerEnabled = false;
        MetricsReportingEnabled = false;
        CrashReportingEnabled = false;
        BackgroundModeEnabled = false;
        DnsOverHttpsMode = "secure";
        PromotionalTabsEnabled = false;
        PrivacySandboxPromptEnabled = false;

        DefaultSearchProviderEnabled = true;

        ExtensionInstallForcelist = map (extension: extension.id) [
          {
            name = "SponserBlock for Youtube";
            id = "mnjggcdmjocbbbhaepdhchncahnbgone";
          }
          {
            name = "Uninternet";
            id = "ihgeijoonjmdfkamhpgoedplnmbencgd";
          }
          {
            name = "Remove Youtube Shorts";
            id = "mgngbgbhliflggkamjnpdmegbkidiapm";
          }
        ];
      };

  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;

      Preferences = {
        "browser.compactmode.show" = true;
        "browser.fullscreen.autohide" = false;
        "sidebar.verticalTabs" = true;
        "browser.tabs.tabmanager.enabled" = false;
        "ui.systemUsesDarkTheme" = 1;
        "browser.toolbars.bookmarks.visibility" = "always";
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "signon.rememberSignons" = false;
        "ui.key.menuAccessKeyFocuses" = false;
      };
    };
  };
}
