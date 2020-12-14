import DeviceCheck
import Flutter

fileprivate func getFlutterError(_ arg: Error) -> FlutterError {
  return FlutterError(code: "\((arg as NSError).code)", message:arg.localizedDescription, details: nil)
}

public class SwiftDeviceCheckPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugins.flutter.io/device_check", binaryMessenger: registrar.messenger())
    registrar.addMethodCallDelegate(SwiftDeviceCheckPlugin(), channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "Device#isSupported": handleDeviceIsSupported(call.arguments, result: result)
    case "Device#generateToken": handleDeviceGenerateToken(call.arguments, result: result)
    case "AppAttestService#isSupported": handleAppAttestServiceIsSupported(call.arguments, result: result)
    case "AppAttestService#generateKey": handleAppAttestServiceGenerateKey(call.arguments, result: result)
    case "AppAttestService#attestKey": handleAppAttestServiceAttestKey(call.arguments as! [String : Any?], result: result)
    case "AppAttestService#generateAssertion": handleAppAttestServiceGenerateAssertion(call.arguments as! [String : Any?], result: result)
    default: result(FlutterMethodNotImplemented)
    }
  }
  
  private func handleDeviceIsSupported(_ arg: Any?, result: @escaping FlutterResult) {
    guard #available(iOS 11.0, *) else {
      result(FlutterError(code: "unavailable", message: "Only available in iOS 11.0 or newer.", details: nil))
      return
    }
    result(DCDevice.current.isSupported)
  }
  
  private func handleDeviceGenerateToken(_ arg: Any?, result: @escaping FlutterResult) {
    guard #available(iOS 11.0, *) else {
      result(FlutterError(code: "unavailable", message: "Only available in iOS 11.0 or newer.", details: nil))
      return
    }
    DCDevice.current.generateToken { token, error in
      if let error = error {
        result(getFlutterError(error))
        return
      }
      result(token)
    }
  }
  
  private func handleAppAttestServiceIsSupported(_ arg: Any?, result: @escaping FlutterResult) {
    guard #available(iOS 14.0, *) else {
      result(FlutterError(code: "unavailable", message: "Only available in iOS 14.0 or newer.", details: nil))
      return
    }
    result(DCAppAttestService.shared.isSupported)
  }
  
  private func handleAppAttestServiceGenerateKey(_ arg: Any?, result: @escaping FlutterResult) {
    guard #available(iOS 14.0, *) else {
      result(FlutterError(code: "unavailable", message: "Only available in iOS 14.0 or newer.", details: nil))
      return
    }
    DCAppAttestService.shared.generateKey { key, error in
      if let error = error {
        result(getFlutterError(error))
        return
      }
      result(key)
    }
  }
  
  private func handleAppAttestServiceAttestKey(_ arg: [String : Any?], result: @escaping FlutterResult) {
    guard #available(iOS 14.0, *) else {
      result(FlutterError(code: "unavailable", message: "Only available in iOS 14.0 or newer.", details: nil))
      return
    }
    let keyId = arg["keyId"] as! String
    let clientDataHash = (arg["clientDataHash"] as! FlutterStandardTypedData).data
    DCAppAttestService.shared.attestKey(keyId, clientDataHash: clientDataHash) { object, error in
      if let error = error {
        result(getFlutterError(error))
        return
      }
      result(object)
    }
  }
  
  private func handleAppAttestServiceGenerateAssertion(_ arg: [String : Any?], result: @escaping FlutterResult) {
    guard #available(iOS 14.0, *) else {
      result(FlutterError(code: "unavailable", message: "Only available in iOS 14.0 or newer.", details: nil))
      return
    }
    let keyId = arg["keyId"] as! String
    let clientDataHash = (arg["clientDataHash"] as! FlutterStandardTypedData).data
    DCAppAttestService.shared.generateAssertion(keyId, clientDataHash: clientDataHash) { object, error in
      if let error = error {
        result(getFlutterError(error))
        return
      }
      result(object)
    }
  }
}
