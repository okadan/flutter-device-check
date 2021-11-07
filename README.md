# device_check

Flutter plugin for using the Apple's DeviceCheck API on iOS.

**NOTE**

DeviceCheck is supported on iOS 11.0 or newer, and AppAttestService is supported on iOS 14.0 or newer.

If plugin is invoked on unsupported platform, the error will be thrown.

## Usage

To use this plugin, add `device_check` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

**Import**

```dart
import 'package:device_check/device_check.dart';
```

**DeviceCheck**

```dart
bool isSupported = await DeviceCheck.instance.isSupported();

Uint8List token = await DeviceCheck.instance.generateToken();
```

**AppAttestService**

```dart
bool isSupported = await AppAttestService.instance.isSupported();

String keyId = await AppAttestService.instance.generateKey();

Uint8List attestation = await AppAttestService.instance.attestKey(
  keyId: [YOUR KEY_ID],
  clientDataHash: [YOUR CLIENT_DATA_HASH],
);

Uint8List assertion = await AppAttestService.instance.generateAssertion(
  keyId: [YOUR KEY_ID],
  clientDataHash: [YOUR CLIENT_DATA_HASH],
);
```

## Example

This plugin is just a bridge to Apple's DeviceCheck API.

See the [official documentation](https://developer.apple.com/documentation/devicecheck) for example usage.
