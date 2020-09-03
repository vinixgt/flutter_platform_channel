import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    var geolocation:Geolocation!
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel("app.rojas/geolocation", binaryMessenger: controller.binaryMessenger)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)

    self.geolocation = Geolocation(messenger: controller.binaryMessenger);
    

    methodChannel.setMethodCallHandler({(call: FlutterMethodCall, result: FlutterResult) -> Void in
        if call.method == "version" {
            let data: [String:Any] = call.arguments as! [String:Any]

        }
    })
  }

  override func applicationWillTerminate(_ application: UIApplication) {
      self.geolocation.stop()
  }
}
