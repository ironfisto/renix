{ pkgs }:

{
  packages = with pkgs; [
    # Metasploit Framework and dependencies
    metasploit
    ruby
    postgresql    # Required for Metasploit database
    zenity  # For some GUI elements
  ];

  env = {
    # Metasploit configuration directory
    MSF_CONFIG_DIR = "${toString ./.}/metasploit";
    # Database configuration
    MSF_DATABASE_CONFIG = "${toString ./.}/metasploit/database.yml";
  };
}