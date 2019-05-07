import 'dart:io';

import 'package:flutter/services.dart';

/// Flutter plugin for iOS DeviceCheck.
/// 
/// See: https://developer.apple.com/documentation/devicecheck
class IosDeviceCheck {
  static const _channel = MethodChannel('com.naokiokada/ios_device_check');

  IosDeviceCheck._();

  /// A Boolean value derived from `DCDevice.current.isSupported`.
  /// 
  /// See: https://developer.apple.com/documentation/devicecheck/dcdevice
  static Future<bool> get isSupported async {
    assert(Platform.isIOS);
    final bool value = await _channel.invokeMethod('isSupported');
    return value;
  }

  /// A String value derived from `DCDevice.current.generateToken()`.
  /// 
  /// See: https://developer.apple.com/documentation/devicecheck/dcdevice
  static Future<String> generateToken() async {
    assert(Platform.isIOS);
    final String value = await _channel.invokeMethod('generateToken');
    return value;
  }
}
