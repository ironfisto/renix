{ pkgs }:

{
  packages = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
    python3Packages.ipython
  ];

  env = {
    PYTHONPATH = "${pkgs.python3}/lib/python3.11/site-packages";
  };
}