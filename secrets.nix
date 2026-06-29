let
  publicKey = "age13d0njn2d4jrnhgw4laa7jzkgqhfu4m2ermmqrrl6wafssqv63pqs5c7ltz";
in
{
  "secrets/ssh-github.age".publicKeys = [ publicKey ];
}
