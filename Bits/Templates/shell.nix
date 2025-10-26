{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    (pkgs.python3.withPackages (ps: with ps; [
      openai
    ]))
  ];

  # Optional: Define environment variables or setup steps
  shellHook = ''
    echo "Entering Python development shell for your project."
  '';
}