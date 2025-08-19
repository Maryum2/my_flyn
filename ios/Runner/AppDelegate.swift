import UIKit
import Flutter
import AVFoundation  

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.app/permissions", binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      switch call.method {
        case "checkCamera":
          result(self.isCameraGranted())
        case "requestCamera":
          self.requestCamera(result: result)
        default:
          result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func isCameraGranted() -> Bool {
    let status = AVCaptureDevice.authorizationStatus(for: .video)
    return status == .authorized
  }

  private func requestCamera(result: @escaping FlutterResult) {
    AVCaptureDevice.requestAccess(for: .video) { granted in
      result(granted)
    }
  }
}