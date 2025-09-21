{ pkgs }:

{
  packages = with pkgs; [
    # Amass and dependencies
    amass
    caffix
    
    # Additional tools that work well with Amass
    graphviz  # For visualization
    jq        # For JSON processing
  ];

  env = {
    # Amass configuration directory
    AMASS_CONFIG = "${toString ./.}/amass/config.ini";
    AMASS_OUTPUT_DIR = "${toString ./.}/amass/output";
  };
}