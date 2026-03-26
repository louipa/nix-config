let
  yoga = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINUvNbCUxShcBFBX9HdR8ldepKbiPgZJYarIJ4AGf40M loupa@nixos";
in
{
  "secret1.age".publicKeys = [
    yoga
  ];
  "armored-secret.age" = {
    publicKeys = [ yoga ];
    armor = true;
  };
}
