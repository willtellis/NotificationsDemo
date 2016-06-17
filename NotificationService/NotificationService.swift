//
//  NotificationService.swift
//  NotificationService
//
//  Created by Will Ellis on 6/16/16.
//  Copyright © 2016 Will Ellis. All rights reserved.
//

import UserNotifications
import Foundation

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler:(UNNotificationContent) -> Void) {
        print("*****************HERE******************")
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)

        guard let bestAttemptContent = bestAttemptContent else {
            contentHandler(request.content)
            return
        }
        
        guard let basicAttachment = bestAttemptContent.attachments.first, let url = MediaType(appUrl: basicAttachment.url)?.url() else {
            return
        }

        // Modify the notification content here...
        bestAttemptContent.title = "\(bestAttemptContent.title) [modified]"
        
        let downloadTask = URLSession.shared().downloadTask(with: url) { (location, response, error) in
            guard error != nil, let location = location else {
                contentHandler(bestAttemptContent)
                return
            }

            let richAttachment: UNNotificationAttachment
            do {
                richAttachment = try UNNotificationAttachment(identifier: basicAttachment.identifier, url: location, options: nil)
            } catch {
                contentHandler(bestAttemptContent)
                return
            }
            
            bestAttemptContent.attachments = [richAttachment]
            
            contentHandler(bestAttemptContent)

        }
        downloadTask.resume()
        
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
