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
        
        let complete = { [weak self] (result: Bool) -> Void in
            UIView.animate(withDuration: 10, animations: { [weak self] in
                self?.labelHorizontalCenterConstraint.constant = -150
                })
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 10000000000)) {
            UIView.animate(withDuration: 10, animations: { [weak self] in
                self?.labelHorizontalCenterConstraint.constant = 50
                }, completion: complete)
            
        }
        
//        UIView.animate(withDuration: 5) { [weak self] in
//            self?.labelHorizontalCenterConstraint.constant = 20
//        }
    }
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
    }

}
