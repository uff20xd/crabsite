{ pkgs ? import <nixpkgs> { }}: 
pkgs.mkShell {
  #inputsFrom = [ (pkgs.callPackage ./default.nix { }) ];
  buildInputs = with pkgs; [
    nodejs
    htmlhint
  ];
  shellHook = ''
    nvim index.html my_opinions/music/index.html my_opinions/tv_things/index.html homepage.css
    alias gc="git commit"
    alias gp="git push"
    alias ga="git add"
  '';
}
