{ pkgs }:

{
  packages = with pkgs; [
    go
    gopls
    gotools
  ];

  env = {
    GOPATH = builtins.toString (./. + "/../../../gopath");
  };
}