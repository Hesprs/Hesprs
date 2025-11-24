final: prev:
  let
    patchScript = builtins.path { path = ./patch.py; name = "codium-patch-script"; };
    stylesCSS = builtins.path { path = ./styles.css; name = "codium-styles-css"; };
    python = prev.python3; 
  in {
    codium = prev.vscodium.overrideAttrs (oldAttrs: {
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ python ];
      postInstall = (oldAttrs.postInstall or "") + ''
        echo "Running VSCodium patches"
        ${python}/bin/python3 ${patchScript} $out ${stylesCSS}
      '';
    });
  }
