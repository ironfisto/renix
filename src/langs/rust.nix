{ pkgs }:

{
  packages = with pkgs; [
    rustc
    cargo
    rustfmt
    rust-analyzer
  ];

  env = {
    RUSTUP_HOME = "./.rustup";
    CARGO_HOME = "./.cargo";
  };
}