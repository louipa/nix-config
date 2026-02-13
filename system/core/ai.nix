{
  services.ollama = {
    enable = true;
    loadModels = [
      "llama3.2:3b"
    ];
    # syncModels = true;
  };

}
