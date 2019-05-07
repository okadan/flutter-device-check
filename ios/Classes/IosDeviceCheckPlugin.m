#import "IosDeviceCheckPlugin.h"

@implementation IosDeviceCheckPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"com.naokiokada/ios_device_check"
            binaryMessenger:[registrar messenger]];
  IosDeviceCheckPlugin* instance = [[IosDeviceCheckPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if (@available(iOS 11, *)) {
    if ([@"isSupported" isEqualToString:call.method]) {
      result(@([[DCDevice currentDevice] isSupported]));
    } else if ([@"generateToken" isEqualToString:call.method]) {
      [[DCDevice currentDevice] generateTokenWithCompletionHandler:^(NSData* token, NSError* error) {
        if (token != nil) {
          result([token base64EncodedStringWithOptions:0]);
          return;
        }
        result([FlutterError errorWithCode:[NSString stringWithFormat:@"%d", (int)error.code]
                                   message:error.domain
                                   details:error.localizedDescription]);
      }];
    } else {
      result(FlutterMethodNotImplemented);
    }
  } else {
    result([FlutterError errorWithCode:@"unavailable"
                               message:@"DeviceCheck is only available on iOS 11.0 or newer"
                               details:nil]);
  }
}
@end