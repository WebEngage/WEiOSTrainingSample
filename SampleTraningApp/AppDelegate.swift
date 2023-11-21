//
//  AppDelegate.swift
//  SampleTraningApp
//
//  Created by Bhavesh Sarwar on 31/10/23.
//

import UIKit
import WebEngage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        WebEngage.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions, notificationDelegate: self)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate: WEGInAppNotificationProtocol {

    func notificationPrepared(_ inAppNotificationData: [String: Any]!,
                              shouldStop stopRendering: UnsafeMutablePointer<ObjCBool>!) -> [AnyHashable: Any]! {
        print("Notification Prepared : ", inAppNotificationData ?? -1)
        return inAppNotificationData
    }

    func notificationShown(_ inAppNotificationData: [String: Any]!) {
        print("Notification Shown : ", inAppNotificationData ?? -1)
    }

    func notification(_ inAppNotificationData: [String: Any]!, clickedWithAction actionId: String!) {
        print("Notification Clicked : ", inAppNotificationData ?? -1)
    }

    func notificationDismissed(_ inAppNotificationData: [String: Any]!) {
        print("Notification Dismissed : ", inAppNotificationData ?? -1)
    }
}

