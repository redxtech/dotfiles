user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.bookmarks.restore_default_bookmarks", false);
user_pref("browser.contentblocking.category", "standard");
user_pref("browser.startup.page", 3);
user_pref("browser.warnOnQuitShortcut", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", true);
user_pref(
  "browser.newtabpage.activity-stream.section.highlights.includePocket",
  false,
);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.toolbars.bookmarks.visibility", "never");
user_pref("browser.urlbar.update2.engineAliasRefresh", true);
user_pref("devtools.inspector.activeSidebar", "computedview");
user_pref("devtools.inspector.selectedSidebar", "computedview");
user_pref("services.sync.prefs.sync-seen.browser.newtabpage.pinned", true);
user_pref("dom.forms.autocomplete.formautofill", true);
user_pref("full-screen-api.ignore-widgets", true);
user_pref("identity.fxaccounts.account.device.name", "Firefox on Desktop");
user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("media.rdd-vpx.enabled", true);
user_pref("network.dns.disablePrefetch", false);
user_pref("network.predictor.enabled", true);
user_pref("network.prefetch-next", true);
user_pref("svg.context-properties.content.enabled", true);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

const pinned = [
  { url: "https://betaapp.fastmail.com/mail/Inbox", label: "fastmail" },
  { url: "https://www.youtube.com/", label: "yt" },
  { url: "https://github.com/redxtech", label: "github" },
  { url: "https://raindrop.io/", label: "raindrop" },
  { url: "https://www.reddit.com/", label: "reddit" },
  { url: "https://news.ycombinator.com/news", label: "hn" },
  { url: "https://chat.openai.com/?model=gpt-4", label: "chatgpt" },
  { url: "https://photos.google.com/", label: "photos" },
  { url: "https://hoppscotch.io/" },
  { url: "https://gabedunn.dev/" },
  { url: "https://monkeytype.com/", label: "monkeytype" },
];

user_pref("browser.newtabpage.pinned", JSON.stringify(pinned));
