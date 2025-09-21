{ pkgs }:

{
  packages = with pkgs; [
    scala
    sbt
  ];

  env = {
    SBT_OPTS = "-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled";
  };
}