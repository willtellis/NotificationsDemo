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
    @IBOutlet var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
        
        URLSession.getImage(atURL: MediaType.datBoi.url()!) { [weak self] (data, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self?.imageView?.image = UIImage(data: data)
                self?.imageView?.isHidden = false
            }
        }

    }

}
