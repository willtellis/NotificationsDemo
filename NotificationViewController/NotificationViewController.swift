//
//  NotificationViewController.swift
//  NotificationViewController
//
//  Created by Will Ellis on 6/17/16.
//  Copyright © 2016 Will Ellis. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        print("*************HERE**************")
        self.label?.text = notification.request.content.body
        
    }

}
