{ pkgs }:

{
  packages = with pkgs; [
    # Core Rizin reverse engineering toolkit
    rizin
  ];

  env = {
    # Allow users to keep project-specific Rizin init files here
    RZ_CONFIG_HOME = "${toString ./.}/rizin";
  };
}
