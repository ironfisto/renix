{ pkgs ? import <nixpkgs> {} }:

let
  # Import all language configurations
  langs = import ./../src/langs/default.nix { inherit pkgs; };
  
  # Import recon tools
  recon = import ./../src/recon/default.nix { inherit pkgs; };
  cloud = import ./../src/cloud/default.nix { inherit pkgs; };

  # Combine all packages
  allPackages = 
    langs.packages ++
    recon.packages ++
    cloud.packages;

  # Combine all environment variables
  allEnvVars = 
    langs.env //
    recon.env //
    cloud.env;

in pkgs.mkShell {
  buildInputs = allPackages;

  shellHook = ''
    echo "Welcome to the multi-language development environment!"
    echo "Available languages and tools:"
    echo "- Rust: $(rustc --version)"
    echo "- Go: $(go version)"
    echo "- GCC: $(gcc --version | head -n1)"
    echo "- Java: $(java --version | head -n1)"
    echo "- Scala: $(scala --version)"
    echo "- Ruby: $(ruby --version)"
    echo "- Zig: $(zig version)"
    echo "- Python: $(python3 --version)"
    echo "- AWS CLI: $(aws --version)"
  '';

  # Set all environment variables
  inherit (allEnvVars) RUSTUP_HOME CARGO_HOME GOPATH JAVA_HOME PYTHONPATH;
  inherit (allEnvVars) SBT_OPTS GEM_HOME;
}
