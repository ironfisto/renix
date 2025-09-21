{ pkgs }:

{
  packages = with pkgs; [
    # Nmap and its scripts
    nmap
    
    # Additional Nmap script dependencies
    openssl
    lua

    # Additional useful tools that complement nmap
    netcat
    tcpdump
    masscan  # For faster port scanning
  ];

  env = {
    # Set Nmap scripts directory
    NMAPDIR = "${pkgs.nmap}/share/nmap";
  };
}