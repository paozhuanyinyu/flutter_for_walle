import Flutter
import UIKit

public class SwiftFlutterForWallePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "kaige.com/flutter_for_walle", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterForWallePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if call.method == "getChannel"{
          let arguments = call.arguments as? [String: Any] ?? [String: Any]()
          guard let channel = arguments["iosChannel"]
              else {return}
          result(channel as? String ?? "AppStore")
      }else if call.method == "getPlatformVersion"{
          result("iOS " + UIDevice.current.systemVersion)
      }else{
          result(FlutterMethodNotImplemented)
      }
    }
}
