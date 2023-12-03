final: prev:

{
  picom-jonaburg = prev.picom-jonaburg.overrideAttrs
    (oldAttrs: { meta.mainProgram = "picom"; });
  vivaldi = prev.vivaldi.override {
    commandLineArgs = "--force-dark-mode";
    proprietaryCodecs = true;
    # enableWidevine = true; # TODO: vivaldi crashes when this is enabled, need to fix
  };
}
