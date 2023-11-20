final: prev:

{
  vivaldi = prev.vivaldi.override {
    commandLineArgs = "--force-dark-mode";
    proprietaryCodecs = true;
    # enableWidevine = true; # TODO: vivaldi crashes when this is enabled, need to fix
  };
}
