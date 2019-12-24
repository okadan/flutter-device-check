import DeviceCheck
import Flutter

public class SwiftIosDeviceCheckPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "plugins.flutter.io/ios_device_check", binaryMessenger: registrar.messenger())
        let instance = SwiftIosDeviceCheckPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if #available(iOS 11.0, *) {
            if call.method == "isSupported" {
                result(DCDevice.current.isSupported)
            } else if call.method == "generateToken" {
                DCDevice.current.generateToken { token, error in
                    if let error = error {
                        result(FlutterError(code: "generation_failed", message: error.localizedDescription, details: nil))
                    } else {
                        result(token?.base64EncodedString())
                    }
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        } else {
            result(FlutterError(code: "unavailable", message: "DeviceCheck API is only available on iOS 11.0 or newer.", details: nil))
        }
    }
}
