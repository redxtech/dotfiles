final: prev:

let
  nixGLWrap = wrapper: pkg:
    prev.runCommand "${pkg.name}-nixgl-wrapper" { } ''
      mkdir $out
      ln -s ${pkg}/* $out
      rm $out/bin
      mkdir $out/bin
      for bin in ${pkg}/bin/*; do
       wrapped_bin=$out/bin/$(basename $bin)
       echo "exec ${prev.lib.getExe wrapper} $bin \$@" > $wrapped_bin
       chmod +x $wrapped_bin
      done
    '';
in {
  kitty = nixGLWrap prev.nixgl.nixGLIntel prev.kitty;
  mpv = nixGLWrap prev.nixgl.nixGLIntel prev.mpv;
  rio = nixGLWrap prev.nixgl.nixGLIntel prev.rio;
}
