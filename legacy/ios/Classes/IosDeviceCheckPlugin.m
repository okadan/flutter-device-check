#import "IosDeviceCheckPlugin.h"
#if __has_include(<ios_device_check/ios_device_check-Swift.h>)
#import <ios_device_check/ios_device_check-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ios_device_check-Swift.h"
#endif

@implementation IosDeviceCheckPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIosDeviceCheckPlugin registerWithRegistrar:registrar];
}
@end
