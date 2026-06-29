let
  publicKey = "age1ky4kalve8l3l47x5j8ytemkyaunwecz9u8g7uk8mnjpqlqm2lytswp8kr9";
in
{
  "secrets/ssh-github.age".publicKeys = [ publicKey ];
}
