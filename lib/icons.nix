{ lib }:

let
  inherit (lib) toLower fixedWidthString;
  hex4 = n: toLower (fixedWidthString 4 "0" (lib.toHexString n));
  chr =
    n:
    if n <= 65535 then
      builtins.fromJSON ''"\u${hex4 n}"''
    else
      let
        v = n - 65536;
        hi = 55296 + v / 1024;
        lo = 56320 + builtins.bitAnd v 1023;
      in
      builtins.fromJSON ''"\u${hex4 hi}\u${hex4 lo}"'';
in
{
  wifi = chr 984489;
  wifiOff = chr 984490;
  ethernet = chr 983552;
  battery = chr 983161;
  battery10 = chr 983162;
  battery20 = chr 983163;
  battery30 = chr 983164;
  battery40 = chr 983165;
  battery50 = chr 983166;
  battery60 = chr 983167;
  battery70 = chr 983168;
  battery80 = chr 983169;
  battery90 = chr 983170;
  batteryCharging = chr 983172;
  powerPlug = chr 984741;
}
