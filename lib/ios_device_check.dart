import 'package:flutter/services.dart';

const MethodChannel _channel =
    MethodChannel('plugins.flutter.io/ios_device_check');

/// Flutter plugin for accessing the iOS DeviceCheck.
///
/// See: https://developer.apple.com/documentation/devicecheck
class IosDeviceCheck {
  IosDeviceCheck._();

  /// The value indicating whether the DeviceCheck API is available on the current device.
  static Future<bool> isSupported() async {
    return _channel.invokeMethod('isSupported').then((value) => value!);
  }

  /// Generates a token that identifies the current device.
  ///
  /// Converted to string from NSData from ios platform using Base64-encoding.
  static Future<String> generateToken() async {
    return _channel.invokeMethod('generateToken').then((value) => value!);
  }
}
