{ pkgs ? import <nixpkgs> { }}: 
pkgs.mkShell {
  #inputsFrom = [ (pkgs.callPackage ./default.nix { }) ];
  buildInputs = with pkgs; [
    nodejs
    htmlhint
  ];
  shellHook = ''
    nvim index.html my_opinions/music/index.html my_opinions/tv_things/index.html homepage.css my_opinions/music/musicpage.css
  '';
}
