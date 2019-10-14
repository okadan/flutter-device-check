# ios_device_check

A Flutter plugin to use iOS DeviceCheck.

## Usage

To use this plugin, add `ios_device_check` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

``` dart
import 'package:ios_device_check/ios_device_check.dart';

// Check whether the DeviceCheck API is available on the current device.
bool isSupported = await IosDeviceCheck.isSupported;

// Generate a token (Base64-encoded string).
String token = await IosDeviceCheck.generateToken();
```

## Note

DeviceCheck API is only supported on iOS 11.0 or newer.

If the plugin is invoked on unsupported platform, the error will be thrown.
