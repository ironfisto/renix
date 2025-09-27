{ pkgs }:

{
  packages = with pkgs; [
    # LLDB debugger with Python support available via Python 3
    lldb
    python3
  ];

  env = {
    # Expose debugserver path for remote debugging workflows
    LLDB_DEBUGSERVER_PATH = "${pkgs.lldb}/bin/debugserver";
  };
}
