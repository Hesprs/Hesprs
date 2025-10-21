# my-custom-font.nix
{ pkgs, lib, ... }:

# Replace 'my-custom-font.zip' with the path to your font file(s)
# Note: You can use other fetchers (like fetchurl) if the font is available online.
pkgs.stdenv.mkDerivation {
  pname = "SF-Mono";
  version = "1.0"; # Set the actual version
  src = ./sf-mono.zip; # 🚨 CHANGE THIS PATH 🚨

  # If your source is a ZIP or other archive
  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src
    runHook postUnpack
  '';

  # Install the font files to the correct output location
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/truetype
    # Copy your font files (e.g., .ttf, .otf)
    # Adjust the source folder ('./*') based on what the zip extracts
    find . -type f \( -iname "*.ttf" -o -iname "*.otf" \) -exec install -Dm644 {} $out/share/fonts/truetype/ \;
    runHook postInstall
  '';

  meta = with lib; {
    description = "A custom font not in nixpkgs";
    license = licenses.unfree; # Change this to match the font's actual license
  };
}