{ pkgs }:

{
  packages = with pkgs; [
    # SQLmap and its dependencies
    sqlmap
    python3  # SQLmap requires Python
    python3Packages.requests  # For HTTP requests
    python3Packages.pip  # For additional requirements
  ];

  env = {
    # SQLmap configuration directory
    SQLMAP_CONFIG_DIR = "${toString ./.}/sqlmap";
    # Custom output directory for scan results
    SQLMAP_OUTPUT_DIR = "${toString ./.}/sqlmap/output";
  };
}