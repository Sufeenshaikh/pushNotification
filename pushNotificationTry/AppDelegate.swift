//
//  AppDelegate.swift
//  pushNotificationTry
//
//  Created by Rohit Dhakad on 25/12/23.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate , UNUserNotificationCenterDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        UNUserNotificationCenter.current().delegate = self
               UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                   if granted {
                       print("Notification permission granted")
                   } else {
                       print("Notification permission denied")
                   }
               }
               
               application.registerForRemoteNotifications()
        
        return true
    }
    
    // Handle successful registration for remote notifications
       func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
           let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
           print("Device Token:", token)
           
       }

       // Handle failure to register for remote notifications
       func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
           print("Failed to register for remote notifications:", error.localizedDescription)
       }

       // Handle incoming notifications while the app is in the foreground
       func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           // Handle the notification while the app is in the foreground
           completionHandler([.alert, .sound, .badge])
       }

       // Handle user interactions with notifications
       func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
           // Handle user's response to the notification
           completionHandler()
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

