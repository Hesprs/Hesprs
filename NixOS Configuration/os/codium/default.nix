final: prev:
  let
    # 1. Turn local files into storable paths (derivations)
    patchScript = builtins.path { path = ./patch.py; name = "codium-patch-script"; };
    stylesCSS   = builtins.path { path = ./styles.css; name = "codium-styles-css"; };
  
    # A helper for clarity, though you can use pkgs.python3 directly
    python = prev.python3; 
  in {
    codium = prev.vscodium.overrideAttrs (oldAttrs: {
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ python ];
      preFixup = (oldAttrs.preFixup or "") + "gappsWrapperArgs+=( --prefix LD_LIBRARY_PATH : ${prev.lib.makeLibraryPath [ prev.gcc.cc.lib ]} )";
      postInstall = (oldAttrs.postInstall or "") + ''
        echo "Running VSCodium patches"
        ${python}/bin/python3 ${patchScript} $out ${stylesCSS}
      '';
    });
  }
