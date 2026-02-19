{ config, ... }:
{
  services.ollama = {
    enable = true;
    loadModels = [
      "llama3.2:3b"
    ];
    # syncModels = true;
  };
  services.nixai = {
    enable = true;
    mcp.enable = true;
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
}
