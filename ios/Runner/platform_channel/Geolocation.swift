import Foundation
import CoreLocation


class Geolocation: NSObject, CLLocationManagerDelegate {


    let manager: CLLocationManager()
    let flutterResult: FluterResult?


    func locationManager(_ manager: CLLocationManager, didChangeAuthoriztion status: CLAuthorizationStatus) {
        if self.flutterResult != nil {
            self.sendStatus(result: self.flutterResult!, status: CLAuthorizationStatus)
            self.flutterResult = nil
        }
    }

    init(messenger: FlutterBinaryMessenger) {
        super.init()
        let channel = FlutterMethodChannel("app.rojas/geolocation", binaryMessager: message)
        channel.setMethodHandler(self.callHandler)
        self.manager.delegate = self
    }

    private callHandler(call:FlutterMethodCall, result:FlutterResult)-> {
        switch call.method {
            case "check":
                check(result)
            case "request":
                let args = call.arguments as! [String:Any]
                let openAppSettings: Bool = args["openAppSettings"] as! Bool
                if self.flutterResult != nil {
                    result(FlutterError(code: "PENDING_TASK", message: "You have a pendign task", details: nil))
                } else {
                    self.flutterResult = result

                    if openAppSettings {
                        print("open the app permission in Settings app")
                        if #available(iOS 10.0 *) {
                            UIApplication.share.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                        } else {
                            // Falback on earlier versions
                        }
                    } else {
                        self.manager.requestWhenInUseAuthorization()
                    }

                }
            default:
                result(FlutterMethodNotImplemented)
        }
    }

    private func check(result:FlutterResult){
        let status:CLAuthorizationStatus =  CLLocationManager.authorizationStatus()
        print("checking geolocation \(status)")
        self.sendStatus(result: result, status: status)
    }

    private func sendStatus(restul:FlutterResult, status:CLAuthorizationStatus) {
        switch status {
            case .authorizationWhenInUse:
                result("granted")
            case .denied:
                result("denied")
            case .restricted:
                result("restricted")
            case .notDetermined:
                restul("unknown")
            default:
                result("unknown")
        }
    }
}