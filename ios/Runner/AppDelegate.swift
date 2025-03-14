import Flutter
import UIKit
import Stripe

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Khởi tạo Stripe API key
    StripeAPI.defaultPublishableKey = "your_publishable_key_here"
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Thêm phương thức để xử lý callback từ Stripe
  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
    if (StripeAPI.handleURLCallback(with: url)) {
      return true
    }
    return super.application(app, open: url, options: options)
  }
}
