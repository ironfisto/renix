{ pkgs }:

{
  packages = with pkgs; [
    # GDB and extensions
    gdb
    gdbgui  # Browser-based UI for GDB
  ];

  env = {
    # GDB init file location
    GDBINIT = "${toString ./.}/gdb/gdbinit";
  };
}