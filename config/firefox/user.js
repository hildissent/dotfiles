// Firefox privacy prefs. Symlinked into the default-release profile by bootstrap.sh.
// user.js is re-applied on every launch, so these override changes made in the UI.

// Clear on quit
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", true);
user_pref("privacy.clearOnShutdown_v2.formdata", true);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);  // sites allowed in policies.json are kept
user_pref("privacy.clearOnShutdown_v2.cache", true);
