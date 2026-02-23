let
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINUvNbCUxShcBFBX9HdR8ldepKbiPgZJYarIJ4AGf40M loupa@nixos";
in
{
  "secret1.age".publicKeys = [
    laptop
  ];
  "armored-secret.age" = {
    publicKeys = [ laptop ];
    armor = true;
  };
}
