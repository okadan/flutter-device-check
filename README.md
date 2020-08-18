# ios_device_check

Flutter plugin for accessing the iOS DeviceCheck.

Note: DeviceCheck is only available in iOS 11.0 or newer. If plugin is invoked on unsupported platform, the error will be thrown.

## Usage

To use this plugin, add `ios_device_check` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

``` dart
import 'package:ios_device_check/ios_device_check.dart';

// Check whether the DeviceCheck API is available on the current device.
bool isSupported = await IosDeviceCheck.isSupported();

// Generate a token (Base64-encoded string).
String token = await IosDeviceCheck.generateToken();
```

Please see the [API Doc](https://pub.dev/documentation/ios_device_check/latest/) for more details.
