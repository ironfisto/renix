{ pkgs }:

let
  # Import individual tool configurations
  nmap = import ./nmap.nix { inherit pkgs; };
  sqlmap = import ./sqlmap.nix { inherit pkgs; };
  gdb = import ./gdb.nix { inherit pkgs; };
  lldb = import ./lldb.nix { inherit pkgs; };
  metasploit = import ./metasploit.nix { inherit pkgs; };
  ffuf = import ./ffuf.nix { inherit pkgs; };
  amass = import ./amass.nix { inherit pkgs; };
  nuclei = import ./nuclei.nix { inherit pkgs; };
  mimikatz = import ./mimikatz.nix { inherit pkgs; };

in {
  # Combine packages from all tools
  packages = 
    nmap.packages ++
    sqlmap.packages ++
    gdb.packages ++
    lldb.packages ++
    metasploit.packages ++
    ffuf.packages ++
    amass.packages ++
    nuclei.packages ++
    mimikatz.packages;

  # Combine environment variables
  env = 
    nmap.env //
    sqlmap.env //
    gdb.env //
    lldb.env //
    metasploit.env //
    ffuf.env //
    amass.env //
    nuclei.env //
    mimikatz.env;
}
