{ pkgs ? import <nixpkgs> {} }:

let
  # Import all language configurations
  rust = import ./src/langs/rust.nix { inherit pkgs; };
  go = import ./src/langs/go.nix { inherit pkgs; };
  c = import ./src/langs/c.nix { inherit pkgs; };
  java = import ./src/langs/java.nix { inherit pkgs; };
  scala = import ./src/langs/scala.nix { inherit pkgs; };
  ruby = import ./src/langs/ruby.nix { inherit pkgs; };
  zig = import ./src/langs/zig.nix { inherit pkgs; };
  python = import ./src/langs/python.nix { inherit pkgs; };
  
  # Import recon tools
  recon = import ./src/recon/default.nix { inherit pkgs; };

  # Combine all packages
  allPackages = 
    rust.packages ++
    go.packages ++
    c.packages ++
    java.packages ++
    scala.packages ++
    recon.packages ++
    ruby.packages ++
    zig.packages ++
    python.packages;

  # Combine all environment variables
  allEnvVars = 
    rust.env //
    go.env //
    java.env //
    scala.env //
    ruby.env //
    python.env;

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
  '';

  # Set all environment variables
  inherit (allEnvVars) RUSTUP_HOME CARGO_HOME GOPATH JAVA_HOME PYTHONPATH;
  inherit (allEnvVars) SBT_OPTS GEM_HOME;
}
