# google_play_instant

Flutter plugin for Google Play Instant API

## Features

* Checks whether the running app is an instant app or not.
* Shows install prompt to the user.

## Getting Started

initialize the Google play instant object.

```dart
final googlePlayInstant = GooglePlayInstant();
```

check whether the current app is an instant app:

```dart
final isInstantApp = await googlePlayInstant.isInstantApp();
```

show install prompt (native android dialog):

```dart
googlePlayInstant.showInstallPrompt();
```
