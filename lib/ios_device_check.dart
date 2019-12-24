import 'package:flutter/services.dart';

/// A Flutter plugin to use iOS DeviceCheck.
/// 
/// See: https://developer.apple.com/documentation/devicecheck
class IosDeviceCheck {
  static const MethodChannel _channel =
    MethodChannel('plugins.flutter.io/ios_device_check');

  IosDeviceCheck._();

  /// A Boolean value indicating whether the DeviceCheck API is available on the current device.
  static Future<bool> isSupported() async {
    return _channel.invokeMethod('isSupported');
  }

  /// Generates a token that identifies the current device.
  /// 
  /// Converted to string from NSData from ios platform using Base64-encoding.
  static Future<String> generateToken() async {
    return _channel.invokeMethod('generateToken');
  }
}
