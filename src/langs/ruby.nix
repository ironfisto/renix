{ pkgs }:

{
  packages = with pkgs; [
    ruby
    bundler
    rubyPackages.solargraph
  ];

  env = {
    GEM_HOME = "./.gem";
  };
}