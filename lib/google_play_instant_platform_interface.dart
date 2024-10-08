import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'google_play_instant_method_channel.dart';

abstract class GooglePlayInstantPlatform extends PlatformInterface {
  /// Constructs a GooglePlayInstantPlatform.
  GooglePlayInstantPlatform() : super(token: _token);

  static final Object _token = Object();

  static GooglePlayInstantPlatform _instance = MethodChannelGooglePlayInstant();

  /// The default instance of [GooglePlayInstantPlatform] to use.
  ///
  /// Defaults to [MethodChannelGooglePlayInstant].
  static GooglePlayInstantPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GooglePlayInstantPlatform] when
  /// they register themselves.
  static set instance(GooglePlayInstantPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> isInstantApp() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void showInstallPrompt() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
