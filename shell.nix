{ pkgs ? import <nixpkgs> { }}: 
pkgs.mkShell {
  #inputsFrom = [ (pkgs.callPackage ./default.nix { }) ];
  buildInputs = with pkgs; [
    nodejs
    htmlhint
  ];
  shellHook = ''
    alias gc="git commit"
    alias gp="git push"
    alias ga="git add"
    nvim index.html my_opinions/music/index.html my_opinions/tv_things/index.html homepage.css
  '';
}
