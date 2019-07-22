import 'dart:io';

import 'package:flutter/services.dart';

/// A Flutter plugin to use iOS DeviceCheck.
/// 
/// See: https://developer.apple.com/documentation/devicecheck
class IosDeviceCheck {
  static const _channel = MethodChannel('naokiokada.com/ios_device_check');

  IosDeviceCheck._();

  /// A boolean value from `DCDevice.current.isSupported`.
  /// 
  /// See: https://developer.apple.com/documentation/devicecheck/dcdevice
  static Future<bool> get isSupported async {
    assert(Platform.isIOS);
    return _channel.invokeMethod('isSupported');
  }

  /// A string value from `DCDevice.current.generateToken()` that using Base64Encoding.
  /// 
  /// See: https://developer.apple.com/documentation/devicecheck/dcdevice
  static Future<String> generateToken() async {
    assert(Platform.isIOS);
    return _channel.invokeMethod('generateToken');
  }
}
