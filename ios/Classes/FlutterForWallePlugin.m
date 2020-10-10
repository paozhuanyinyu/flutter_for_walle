#import "FlutterForWallePlugin.h"
#if __has_include(<flutter_for_walle/flutter_for_walle-Swift.h>)
#import <flutter_for_walle/flutter_for_walle-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_for_walle-Swift.h"
#endif

@implementation FlutterForWallePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterForWallePlugin registerWithRegistrar:registrar];
}
@end
