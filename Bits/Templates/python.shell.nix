# Run: `nix-shell python.shell.nix`

let
  pkgs = import <nixpkgs> { };
in
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