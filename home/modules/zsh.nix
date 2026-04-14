{ lib, system, pkgs, ... }:
let
  isDarwin = lib.hasSuffix "darwin" system;
in
{
  # Tools already present in system packages on Linux
  home.packages = lib.optionals isDarwin (with pkgs; [
    eza
    bat
    btop
    zoxide
    lazygit
    yazi
  ]);

  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "kubectl"
        "helm"
        "docker"
      ];
    };

    shellAliases = {
      l = "eza -lah";
      ls = "eza";
      tree = "eza --tree --git-ignore";

      cat = "bat";
      top = "btop";

      c = "clear";
      cls = "clear";
      h = "history";

      g = "lazygit";
      y = "yazi";
      cc = "bunx @anthropic-ai/claude-code";
      oc = "bunx opencode-ai";

      nr = if isDarwin
        then "sudo nix run nix-darwin -- switch --flake /Users/loupa/nix-config#macbook"
        else "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";

      ".." = "cd ../";
      "../" = "cd ../";
      "..." = "cd ../..";

      untar = "tar -zxvf";
      mktar = "tar -cvzf";

      myip = "curl https://ipecho.net/plain";
      olstop = "ollama ps | awk 'NR>1 {print $1}' | xargs -L 1 ollama stop";
    } // lib.optionalAttrs (!isDarwin) {
      pbcopy = "xclip -selection clipboard";
      ports = "netstat -tulanp";
    };

    initContent = ''
      zsh-newuser-install() { :; }
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
      ${lib.optionalString (!isDarwin) "nd() { deploy \"/etc/nixos#$1\" }"}
    '';
  };
}
