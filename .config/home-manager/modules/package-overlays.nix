final: prev:

{
  vivaldi = prev.vivaldi.override {
    commandLineArgs = "--force-dark-mode";
    proprietaryCodecs = true;
    enableWidevine = true;
    vivaldi-ffmpeg-codecs = prev.vivaldi-ffmpeg-codecs;
    widevine-cdm = prev.widevine-cdm;
  };
}
