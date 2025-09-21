{ pkgs }:

{
  packages = with pkgs; [
    zig
    zls
  ];

  env = {};
}