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
}
