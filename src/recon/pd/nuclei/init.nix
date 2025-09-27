{ pkgs }:

{
  packages = with pkgs; [
    # Nuclei and its templates
    nuclei
    nuclei-templates
  ];

  env = {
    # Set Nuclei templates directory
    NUCLEI_TEMPLATES_DIR = "${pkgs.nuclei-templates}/share/nuclei/templates";
  };
}
