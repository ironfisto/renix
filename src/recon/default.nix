{ pkgs }:

let
  # Import individual tool configurations
  nmap = import ./nmap.nix { inherit pkgs; };
  sqlmap = import ./sqlmap.nix { inherit pkgs; };
  lldb = import ./lldb.nix { inherit pkgs; };
  gdb = import ./gdb.nix { inherit pkgs; };
  metasploit = import ./metasploit.nix { inherit pkgs; };
  ffuf = import ./ffuf.nix { inherit pkgs; };
  amass = import ./amass.nix { inherit pkgs; };

in {
  # Combine packages from all tools
  packages = 
    nmap.packages ++
    sqlmap.packages ++
    lldb.packages ++
    gdb.packages ++
    metasploit.packages ++
    ffuf.packages ++
    amass.packages;

  # Combine environment variables
  env = 
    nmap.env //
    sqlmap.env //
    lldb.env //
    gdb.env //
    metasploit.env //
    ffuf.env //
    amass.env;
}