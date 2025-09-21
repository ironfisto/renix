{ pkgs }:

{
  packages = with pkgs; [
    gcc
    gdb
    gnumake
    clang
    clang-tools
  ];

  env = {};
}