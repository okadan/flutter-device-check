import 'dart:typed_data';

import 'package:flutter/services.dart';

const MethodChannel _channel = MethodChannel('plugins.flutter.io/device_check');

/// This class contains methods to access DeviceCheck's [DCDevice](https://developer.apple.com/documentation/devicecheck/dcdevice) API.
class DCDevice {
  DCDevice._();
  static DCDevice? _instance;
  static DCDevice get instance => _instance ??= DCDevice._();

  /// Dart method to access DCDevice's `isSupported` API.
  Future<bool> isSupported() async {
    return _channel.invokeMethod('Device#isSupported').then((value) => value!);
  }

  /// Dart method to access DCDevice's `generateToken` API.
  Future<Uint8List> generateToken() async {
    return _channel
        .invokeMethod('Device#generateToken')
        .then((value) => value!);
  }
}

/// This class contains methods to access DeviceCheck's [DCAppAttestService](https://developer.apple.com/documentation/devicecheck/dcappattestservice) API.
class DCAppAttestService {
  DCAppAttestService._();
  static DCAppAttestService? _instance;
  static DCAppAttestService get instance =>
      _instance ??= DCAppAttestService._();

  /// Dart method to access DCAppAttestService's `isSupported` API.
  Future<bool> isSupported() async {
    return _channel
        .invokeMethod('AppAttestService#isSupported')
        .then((value) => value!);
  }

  /// Dart method to access DCAppAttestService's `generateKey` API.
  Future<String> generateKey() async {
    return _channel
        .invokeMethod('AppAttestService#generateKey')
        .then((value) => value!);
  }

  /// Dart method to access DCAppAttestService's `attestKey` API.
  Future<Uint8List> attestKey({
    required String keyId,
    required Uint8List clientDataHash,
  }) async {
    return _channel.invokeMethod('AppAttestService#attestKey', {
      'keyId': keyId,
      'clientDataHash': clientDataHash,
    }).then((value) => value!);
  }

  /// Dart method to access DCAppAttestService's `generateAssertion` API.
  Future<Uint8List> generateAssertion({
    required String keyId,
    required Uint8List clientDataHash,
  }) async {
    return _channel.invokeMethod('AppAttestService#generateAssertion', {
      'keyId': keyId,
      'clientDataHash': clientDataHash,
    }).then((value) => value!);
  }
}
