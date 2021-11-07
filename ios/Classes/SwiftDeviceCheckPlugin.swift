import DeviceCheck
import Flutter

public class SwiftDeviceCheckPlugin: NSObject, FlutterPlugin, PigeonHostApi {
  public static func register(with registrar: FlutterPluginRegistrar) {
    PigeonHostApiSetup(registrar.messenger(), SwiftDeviceCheckPlugin())
  }

  public func deviceCheckIsSupportedWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
    guard #available(iOS 11.0, *) else { return false as NSNumber }
    return DCDevice.current.isSupported as NSNumber
  }

  public func deviceCheckGenerateToken(completion: @escaping (FlutterStandardTypedData?, FlutterError?) -> Void) {
    guard #available(iOS 11.0, *) else { completion(nil, createErrorUnavailable("11.0")); return }
    DCDevice.current.generateToken() { token, error in
      if let error = error { completion(nil, createError(error)); return }
      completion(FlutterStandardTypedData(bytes: token!), nil)
    }
  }

  public func appAttestServiceIsSupportedWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> NSNumber? {
    guard #available(iOS 14.0, *) else { return false as NSNumber }
    return DCAppAttestService.shared.isSupported as NSNumber
  }

  public func appAttestServiceGenerateKey(completion: @escaping (String?, FlutterError?) -> Void) {
    guard #available(iOS 14.0, *) else { completion(nil, createErrorUnavailable("14.0")); return }
    DCAppAttestService.shared.generateKey() { keyId, error in
      if let error = error { completion(nil, createError(error)); return }
      completion(keyId!, nil)
    }
  }

  public func appAttestServiceAttestKeyKeyId(_ keyId: String?, clientDataHash: FlutterStandardTypedData?, completion: @escaping (FlutterStandardTypedData?, FlutterError?) -> Void) {
    guard #available(iOS 14.0, *) else { completion(nil, createErrorUnavailable("14.0")); return }
    DCAppAttestService.shared.attestKey(keyId!, clientDataHash: clientDataHash!.data) { attestation, error in
      if let error = error { completion(nil, createError(error)); return }
      completion(FlutterStandardTypedData(bytes: attestation!), nil)
    }
  }

  public func appAttestServiceGenerateAssertionKeyId(_ keyId: String?, clientDataHash: FlutterStandardTypedData?, completion: @escaping (FlutterStandardTypedData?, FlutterError?) -> Void) {
    guard #available(iOS 14.0, *) else { completion(nil, createErrorUnavailable("14.0")); return }
    DCAppAttestService.shared.generateAssertion(keyId!, clientDataHash: clientDataHash!.data) { assertion, error in
      if let error = error { completion(nil, createError(error)); return }
      completion(FlutterStandardTypedData(bytes: assertion!), nil)
    }
  }
}

private func createError(_ error: Error) -> FlutterError {
  let error = error as NSError
  return FlutterError(code: "\(error.domain) \(error.code)", message: error.localizedDescription, details: nil)
}

private func createErrorUnavailable(_ version: String) -> FlutterError {
  return FlutterError(code: "unavailable", message: "Only available in iOS \(version) or newer.", details: nil)
}
