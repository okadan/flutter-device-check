import 'dart:io';

import 'package:flutter/services.dart';

/// A Flutter plugin to use iOS DeviceCheck.
/// 
/// See: https://developer.apple.com/documentation/devicecheck
class IosDeviceCheck {
  static const _channel = MethodChannel('naokiokada.com/ios_device_check');

  IosDeviceCheck._();

  /// A Boolean value indicating whether the DeviceCheck APIs are available on the current device.
  static Future<bool> get isSupported async {
    assert(Platform.isIOS);
    return _channel.invokeMethod('isSupported');
  }

  /// Generates a token that identifies the current device.
  /// 
  /// Converted to string from NSData from ios platform using Base64-encoding.
  static Future<String> generateToken() async {
    assert(Platform.isIOS);
    return _channel.invokeMethod('generateToken');
  }
}
