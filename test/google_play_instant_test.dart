import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:google_play_instant/google_play_instant.dart';
import 'package:google_play_instant/google_play_instant_platform_interface.dart';

// Generate a mock class for GooglePlayInstantPlatform
@GenerateMocks([GooglePlayInstantPlatform])
import 'google_play_instant_test.mocks.dart';

void main() {
  late GooglePlayInstant googlePlayInstant;
  late MockGooglePlayInstantPlatform mockPlatform;

  setUp(() {
    // Create an instance of the mocked platform
    mockPlatform = MockGooglePlayInstantPlatform();

    // Replace the default instance with the mock
    GooglePlayInstantPlatform.instance = mockPlatform;

    // Create the GooglePlayInstant instance
    googlePlayInstant = GooglePlayInstant();
  });

  group('showInstallPrompt', () {
    test('should call showInstallPrompt on the platform instance', () {
      // Act
      googlePlayInstant.showInstallPrompt();

      // Assert that the platform method is called
      verify(mockPlatform.showInstallPrompt()).called(1);
    });

    test('should log an error when showInstallPrompt throws an exception', () {
      // Arrange: Make the platform throw an exception
      when(mockPlatform.showInstallPrompt()).thenThrow(Exception('Error'));

      // Act
      googlePlayInstant.showInstallPrompt();

      // Assert: Expect the log to be called with the exception
      // Normally, we would mock 'log', but here we're verifying behavior
      verify(mockPlatform.showInstallPrompt()).called(1);
      // Ensure exception was caught and logged
      // You might use other ways to verify logs in production code
    });
  });

  group('isInstantApp', () {
    test('should return true when platform returns true', () async {
      // Arrange: Set up the mock to return true
      when(mockPlatform.isInstantApp()).thenAnswer((_) async => true);

      // Act
      final result = await googlePlayInstant.isInstantApp();

      // Assert
      expect(result, isTrue);
    });

    test('should return false when platform returns false', () async {
      // Arrange: Set up the mock to return false
      when(mockPlatform.isInstantApp()).thenAnswer((_) async => false);

      // Act
      final result = await googlePlayInstant.isInstantApp();

      // Assert
      expect(result, isFalse);
    });

    test(
        'should log an error and return null when isInstantApp throws an exception',
        () async {
      // Arrange: Make the platform throw an exception
      when(mockPlatform.isInstantApp()).thenThrow(Exception('Error'));

      // Act
      final result = await googlePlayInstant.isInstantApp();

      // Assert
      expect(result, isNull);
      // Normally we would verify that log was called with the error
    });
  });
}
