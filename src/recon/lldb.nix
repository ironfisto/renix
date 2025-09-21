{ pkgs }:

{
  packages = with pkgs; [
    # Debuggers
    lldb
    lldb.python # Python bindings for LLDB
  ];

  env = {
    LLDB_DEBUGSERVER_PATH = "${pkgs.lldb}/bin/debugserver";
  };
}