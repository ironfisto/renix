{ pkgs }:

let
  # Import individual language configurations
  c = import ./c.nix { inherit pkgs; };
  go = import ./go.nix { inherit pkgs; };
  java = import ./java.nix { inherit pkgs; };
  python = import ./python.nix { inherit pkgs; };
  ruby = import ./ruby.nix { inherit pkgs; };
  rust = import ./rust.nix { inherit pkgs; };
  scala = import ./scala.nix { inherit pkgs; };
  zig = import ./zig.nix { inherit pkgs; };

in {
  # Combine packages from all languages
  packages =
    c.packages ++
    go.packages ++
    java.packages ++
    python.packages ++
    ruby.packages ++
    rust.packages ++
    scala.packages ++
    zig.packages;

  # Combine environment variables
  env =
    c.env //
    go.env //
    java.env //
    python.env //
    ruby.env //
    rust.env //
    scala.env //
    zig.env;
}
