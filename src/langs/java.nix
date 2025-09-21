{ pkgs }:

{
  packages = with pkgs; [
    jdk17
    maven
    gradle
  ];

  env = {
    JAVA_HOME = "${pkgs.jdk17}";
  };
}