{ inputs, ... }:

{
  imports = inputs.self.lib.loadTree ./.;
}
