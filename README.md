# ios_device_check

A Flutter plugin to use iOS DeviceCheck.

## Usage

To use this plugin, add `ios_device_check` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

Then,

``` dart
import 'package:ios_device_check/ios_device_check.dart';

bool isSupported = await IosDeviceCheck.isSupported;
String token = await IosDeviceCheck.generateToken();
```

Please see the example app of this plugin for a full example.

## Note

DeviceCheck API is only supported on iOS 11.0 or newer.

If the plugin is invoked on unsupported platform, it will throw error.
