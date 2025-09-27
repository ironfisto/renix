{ pkgs }:

{
  packages = with pkgs; [
    nuclei
    nuclei-templates
  ];

  env = {
    NUCLEI_TEMPLATES_DIR = "${pkgs.nuclei-templates}/share/nuclei/templates";
  };
}
