{ pkgs }:

{
  packages = with pkgs; [
    ffuf
  ];

  env = {
    # Provide easy access to bundled wordlists and SecLists corpus
    FFUF_WORDLISTS = "${toString ./.}/ffuf/wordlists";
  };
}
