import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

const MethodChannel _channel = MethodChannel('plugins.flutter.io/device_check');

/// DCDevice
class DCDevice {
  const DCDevice._();
  static DCDevice _instance;
  static DCDevice get instance => _instance ??= DCDevice._();

  /// DCDevice.isSupported
  Future<bool> isSupported() async {
    return _channel.invokeMethod('Device#isSupported');
  }

  /// DCDevice.generateToken
  Future<Uint8List> generateToken() async {
    return _channel.invokeMethod('Device#generateToken');
  }
}

/// DCAppAttestService
class DCAppAttestService {
  const DCAppAttestService._();
  static DCAppAttestService _instance;
  static DCAppAttestService get instance => _instance ??= DCAppAttestService._();

  /// DCAppAttestService.isSupported
  Future<bool> isSupported() async {
    return _channel.invokeMethod('AppAttestService#isSupported');
  }

  /// DCAppAttestService.generateKey
  Future<String> generateKey() async {
    return _channel.invokeMethod('AppAttestService#generateKey');
  }

  /// DCAppAttestService.attestKey
  Future<Uint8List> attestKey({
    @required String keyId,
    @required Uint8List clientDataHash,
  }) async {
    return _channel.invokeMethod('AppAttestService#attestKey', {
      'keyId': keyId,
      'clientDataHash': clientDataHash,
    });
  }

  /// DCAppAttestService.generateAssertion
  Future<Uint8List> generateAssertion({
    @required String keyId,
    @required Uint8List clientDataHash,
  }) async {
    return _channel.invokeMethod('AppAttestService#generateAssertion', {
      'keyId': keyId,
      'clientDataHash': clientDataHash,
    });
  }
}
