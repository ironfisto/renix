{ pkgs }:

let
  # Import individual tool configurations
  aws = import ./aws.nix { inherit pkgs; };

in {
  # Combine packages from all tools
  packages = 
    aws.packages;

  # Combine environment variables
  env = 
    aws.env or {};
}
