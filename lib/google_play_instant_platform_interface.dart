import 'google_play_instant_method_channel.dart';

abstract class GooglePlayInstantPlatform {
  /// Constructs a GooglePlayInstantPlatform.
  GooglePlayInstantPlatform();

  static GooglePlayInstantPlatform instance = MethodChannelGooglePlayInstant();

  Future<bool?> isInstantApp() {
    throw UnimplementedError('isInstantApp() has not been implemented.');
  }

  void showInstallPrompt() {
    throw UnimplementedError('showInstallPrompt() has not been implemented.');
  }
}
