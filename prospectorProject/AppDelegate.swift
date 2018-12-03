//
//  AppDelegate.swift
//  prospectorProject
//
//  Created by period3 on 10/26/18.
//  Copyright © 2018 period3. All rights reserved.
//

import UIKit
import PushKit
import UserNotifications
//import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        registerForPushNotifications()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            
            guard granted else { return }
            self.getNotificationSettings()
            
//            let content = UNMutableNotificationContent()
//            content.title = "New Article"
//            content.subtitle = "Nobody Reads our Newspaper"
//            content.body = "This is a new article from the Prospector Group and showing some new data on the paper reading"
//            
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//            
//            let requestIdentifier = "sample request"
//            let request = UNNotificationRequest()
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        
//        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]
//        
//        // Replace 'YOUR_APP_ID' with your OneSignal App ID.
//        OneSignal.initWithLaunchOptions(launchOptions,
//                                        appId: "YOUR_APP_ID",
//                                        handleNotificationAction: nil,
//                                        settings: onesignalInitSettings)
//        
//        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
//        
//        // Recommend moving the below line to prompt for push after informing the user about
//        //   how your app will use them.
//        OneSignal.promptForPushNotifications(userResponse: { accepted in
//            print("User accepted notifications: \(accepted)")
//        })
//        
//        return true
//    }
}
