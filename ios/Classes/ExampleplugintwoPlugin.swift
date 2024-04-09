/*
import Flutter
import UIKit

public class ExampleplugintwoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "exampleplugintwo", binaryMessenger: registrar.messenger())
    let instance = ExampleplugintwoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
 */

import Flutter
import UIKit

public class ExampleplugintwoPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "exampleplugintwo", binaryMessenger: registrar.messenger())
        let instance = ExampleplugintwoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "openPage":
            if let type = call.arguments as? String, type == "SETTINGS" {
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
                        result("Settings page opened successfully")
                    } else {
                        result(FlutterError(code: "OPEN_SETTINGS_FAILED", message: "Unable to open settings page", details: nil))
                    }
                }
            } else {
                result(FlutterError(code: "INVALID_TYPE", message: "Invalid page type", details: nil))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
