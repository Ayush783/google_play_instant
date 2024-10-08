import 'dart:developer';

import 'google_play_instant_platform_interface.dart';

class GooglePlayInstant {
  /// log tag name
  static const _logName = 'GooglePlayInstant';

  /// Displays the Google Play Instant app install prompt.
  void showInstallPrompt() {
    try {
      GooglePlayInstantPlatform.instance.showInstallPrompt();
    } catch (e) {
      log('$e', name: _logName);
    }
  }

  /// Returns `true` if the app is an Instant App.
  Future<bool?> isInstantApp() async {
    try {
      return await GooglePlayInstantPlatform.instance.isInstantApp();
    } catch (e) {
      log('$e', name: _logName);
      return null;
    }
  }

  /// fetches user data when app is installed from an instant app
  void getInstantAppData() {}
}
