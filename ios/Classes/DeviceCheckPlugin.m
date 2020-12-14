#import "DeviceCheckPlugin.h"
#if __has_include(<device_check/device_check-Swift.h>)
#import <device_check/device_check-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "device_check-Swift.h"
#endif

@implementation DeviceCheckPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceCheckPlugin registerWithRegistrar:registrar];
}
@end
