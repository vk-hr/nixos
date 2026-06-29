let
  publicKey = "age1qqpshufn8e20dtdf0lu0pzp7avk7gdhwkkqwe5v4wzas6a9f5ccqq26pzm";
in
{
  "secrets/ssh-github.age".publicKeys = [ publicKey ];
}
