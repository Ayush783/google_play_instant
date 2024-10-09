import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'google_play_instant_platform_interface.dart';

/// An implementation of [GooglePlayInstantPlatform] that uses method channels.
class MethodChannelGooglePlayInstant extends GooglePlayInstantPlatform {
  /// The method channel used to interact with the native platform.
  MethodChannel _methodChannel = const MethodChannel('google_play_instant');

  @visibleForTesting
  MethodChannel get methodChannel => _methodChannel;

  @visibleForTesting
  set methodChannel(MethodChannel channel) => _methodChannel = channel;

  @override
  Future<bool?> isInstantApp() async {
    final isInstantApp =
        await _methodChannel.invokeMethod<bool>('isInstantApp');
    return isInstantApp;
  }

  @override
  void showInstallPrompt() {
    _methodChannel.invokeMethod('showInstallPrompt');
  }
}
