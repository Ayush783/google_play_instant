import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_instant/google_play_instant_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelGooglePlayInstant platform = MethodChannelGooglePlayInstant();
  const MethodChannel channel = MethodChannel('google_play_instant');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });
}
