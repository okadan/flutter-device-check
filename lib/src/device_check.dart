import 'dart:typed_data';

import './pigeon_host_api.g.dart';

final PigeonHostApi _hostApi = PigeonHostApi();

/// A representation of a device that provides a unique, authenticated token.
///
/// See the documentation in DeviceCheck's [DCDevice](https://developer.apple.com/documentation/devicecheck/dcdevice).
class DeviceCheck {
  DeviceCheck._();

  static DeviceCheck? _instance;

  /// The instance of the [DeviceCheck] to use.
  static DeviceCheck get instance => _instance ??= DeviceCheck._();

  /// A Boolean value that indicates whether the device supports the DeviceCheck API.
  ///
  /// See the documentation in DeviceCheck's [DCDevice#isSupported](https://developer.apple.com/documentation/devicecheck/dcdevice/2891519-issupported).
  Future<bool> isSupported() async {
    return _hostApi.deviceCheckIsSupported();
  }

  /// Generates a token that identifies the current device.
  ///
  /// See the documentation in DeviceCheck's [DCDevice#generateToken](https://developer.apple.com/documentation/devicecheck/dcdevice/2902276-generatetoken).
  Future<Uint8List> generateToken() async {
    return _hostApi.deviceCheckGenerateToken();
  }
}

/// A service that you use to validate the instance of your app running on a device.
///
/// See the documentation in DeviceCheck's [DCAppAttestService][https://developer.apple.com/documentation/devicecheck/dcappattestservice].
class AppAttestService {
  AppAttestService._();

  static AppAttestService? _instance;

  /// The instance of the [AppAttestService] to use.
  static AppAttestService get instance => _instance ??= AppAttestService._();

  /// A Boolean that indicates whether a particular device provides the App Attest service.
  ///
  /// See the documentation in DeviceCheck's [DCAppAttestService#isSupported](https://developer.apple.com/documentation/devicecheck/dcappattestservice/3573915-issupported).
  Future<bool> isSupported() async {
    return _hostApi.appAttestServiceIsSupported();
  }

  /// Creates a new cryptographic key for use with the App Attest service.
  ///
  /// See the documentation in DeviceCheck's [DCAppAttestService#generateKey](https://developer.apple.com/documentation/devicecheck/dcappattestservice/3573913-generatekey)
  Future<String> generateKey() async {
    return _hostApi.appAttestServiceGenerateKey();
  }

  /// Asks Apple to attest to the validity of a generated cryptographic key.
  ///
  /// See the documentation in DeviceCheck's [DCAppAttestService#attestKey](https://developer.apple.com/documentation/devicecheck/dcappattestservice/3573911-attestkey).
  Future<Uint8List> attestKey(
      {required String keyId, required Uint8List clientDataHash}) async {
    return _hostApi.appAttestServiceAttestKey(keyId, clientDataHash);
  }

  /// Creates a block of data that demonstrates the legitimacy of an instance of your app running on a device.
  ///
  /// See the documentation in DeviceCheck's [DCAppAttestService#generateAssertion](https://developer.apple.com/documentation/devicecheck/dcappattestservice/3573912-generateassertion).
  Future<Uint8List> generateAssertion(
      {required String keyId, required Uint8List clientDataHash}) async {
    return _hostApi.appAttestServiceGenerateAssertion(keyId, clientDataHash);
  }
}
