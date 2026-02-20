{ config, pkgs, ... }:
{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    #package = pkgs.ollama-vulkan
    #package = pkgs.llama-cpp-rocm;
    #acceleration = “rocm”;

    environmentVariables = {
      HIP_VISIBLE_DEVICES = "1";
      OLLAMA_LLM_LIBRARY = "rocm";
      HCC_AMDGPU_TARGET = "gfx1152"; # nix run nixpkgs#"rocmPackages.rocminfo" -- --run "rocminfo" | grep "gfx"
      HSA_ENABLE_SDMA = "1";
    };

    loadModels = [
      "llama3.2:3b"
      "qwen3:8b"
      "gemma3:4b"
      "deepseek-r1:8b"
    ];
  };

  services.open-webui = {
    enable = true;
    environment =
      let
        inherit (config.services.ollama) host port;
      in
      {
        OLLAMA_API_BASE_URL = "http://${host}:${toString port}";
        WEBUI_AUTH = "False";
      };
  };

  services.nixai = {
    enable = true;
    mcp.enable = true;
  };

  systemd.services.nixai-mcp-server.serviceConfig = {
    TimeoutStopSec = 10;
    KillSignal = "SIGKILL";
  };
}
