{ pkgs }:

{
  packages = with pkgs; [
    # ffuf - Fast web fuzzer
    ffuf
    
    # Additional useful tools for fuzzing
    curl
    jq  # For JSON processing
  ];

  env = {
    # ffuf configuration and wordlists directory
    FFUF_CONFIG_DIR = "${toString ./.}/ffuf";
    FFUF_WORDLIST_DIR = "${toString ./.}/ffuf/wordlists";
  };
}