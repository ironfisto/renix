{ pkgs }:

{
  packages = with pkgs; [
    # SQLmap CLI tool
    sqlmap
    python3  # Provide a Python interpreter for custom scripts/plugins
  ];

  env = {
    # Default locations so SQLmap can persist configs and outputs in the repo
    SQLMAP_CONFIG_DIR = "${toString ./.}/sqlmap";
    SQLMAP_OUTPUT_DIR = "${toString ./.}/sqlmap/output";
  };
}
