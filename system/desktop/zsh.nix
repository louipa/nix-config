{
  pkgs,
  ...
}:
{
  config = {
    environment.systemPackages = with pkgs; [
      zsh
      fastfetch
    ];

    programs = {

      starship.enable = true;

      zsh = {
        enable = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        ohMyZsh = {
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
          h = "history";
          ports = "netstat -tulanp";
          pbcopy = "xclip -selection clipboard";
          olstop = "ollama ps | awk 'NR>1 {print $1}' | xargs -L 1  ollama stop";

          g = "lazygit";
          y = "yazi";
          cc = "bunx @anthropic-ai/claude-code";
          oc = "bunx opencode-ai";

          nr = "sudo nixos-rebuild switch --flake /etc/nixos#laptop";

          ## directory control
          ".." = "cd ../";
          "../" = "cd ../";
          "..." = "cd ../..";

          # tars
          untar = "tar -zxvf";
          mktar = "tar -cvzf";

          myip = "curl https://ipecho.net/plain";
          cls = "clear";
        };

        shellInit = ''
          # Disable zsh's newuser startup script that prompts you to create
          # a ~/.z* file if missing
          zsh-newuser-install() { :; }

          eval "$(zoxide init zsh)"
        '';
      };
    };

    users.defaultUserShell = pkgs.zsh;
  };
}
