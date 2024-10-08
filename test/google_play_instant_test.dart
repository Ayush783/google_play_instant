import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_instant/google_play_instant.dart';
import 'package:google_play_instant/google_play_instant_platform_interface.dart';
import 'package:google_play_instant/google_play_instant_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  final GooglePlayInstantPlatform initialPlatform =
      GooglePlayInstantPlatform.instance;

  test('$MethodChannelGooglePlayInstant is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGooglePlayInstant>());
  });
}
