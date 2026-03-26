# Généré par nixos-generate-config sur le homelab.
# Remplacer ce fichier par la sortie de :
#   nixos-generate-config --show-hardware-config
{ ... }:
{
  # TODO: remplir avec la vraie config hardware
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; # à adapter
  fileSystems."/" = {
    device = "/dev/sda1"; # à adapter
    fsType = "ext4";
  };
}
