//
//  AppDelegate.swift
//  NotificationsDemo
//
//  Created by Will Ellis on 6/14/16.
//  Copyright © 2016 Will Ellis. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var shouldShowImage = false
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        registorForNotifications()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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


}

extension AppDelegate {
    
        
    func registorForNotifications() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
        center.delegate = self
        
        let actionWaddup = UNNotificationAction(identifier: ActionType.waddup.rawValue, title: "Waddup", options: [.foreground])
        let categoryOptions = UNNotificationCategoryOptions(rawValue: 0)
        let plainCategory = UNNotificationCategory(identifier: NotificationType.plain.rawValue, actions: [actionWaddup], minimalActions: [actionWaddup], intentIdentifiers: [], options: categoryOptions)
        let serviceExtensionCategory = UNNotificationCategory(identifier: NotificationType.serviceExtension.rawValue, actions: [actionWaddup], minimalActions: [actionWaddup], intentIdentifiers: [], options: categoryOptions)
        let contentExtensionCategory = UNNotificationCategory(identifier: NotificationType.contentExtension.rawValue, actions: [actionWaddup], minimalActions: [actionWaddup], intentIdentifiers: [], options: categoryOptions)
        center.setNotificationCategories(Set([plainCategory, serviceExtensionCategory, contentExtensionCategory]))
        
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
        guard let action = ActionType(rawValue: response.actionIdentifier) else {
            completionHandler()
            return
        }
        
        switch action {
        case .waddup:
            if let viewController = window?.rootViewController as? ViewController {
                viewController.showImage()
            }
            else {
                shouldShowImage = true
            }
            completionHandler()
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }
}

extension AppDelegate: DatBoiProtocol {
    func datBoiIsComing() -> Bool {
        return shouldShowImage
    }
}
