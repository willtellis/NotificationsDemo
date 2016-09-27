//
//  NotificationViewController.swift
//  VideoContentNotification
//
//  Created by Will Ellis on 8/10/16.
//  Copyright © 2016 Will Ellis. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class AnimatedNotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet var label: UILabel?
    @IBOutlet var labelHorizontalCenterConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        
        UIView.animate(withDuration: 1, animations: {
            self.label?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: nil)
        
        
    }
    
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = "YES!"
    }
    
}
