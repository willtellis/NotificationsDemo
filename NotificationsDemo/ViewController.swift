//
//  ViewController.swift
//  NotificationsDemo
//
//  Created by Will Ellis on 6/14/16.
//  Copyright © 2016 Will Ellis. All rights reserved.
//

import UIKit
import UserNotifications

protocol DatBoiProtocol: class {
    func datBoiIsComing() -> Bool
}

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    weak var delegate = UIApplication.shared().delegate as? DatBoiProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        if let delegate = delegate where delegate.datBoiIsComing() {
            showImage()
        }
    }
    
    func showImage() {
        if let _ = imageView.image {
            imageView.isHidden = false
            return
        }
        URLSession.getImage(atURL: MediaType.datBoi.url()!) { [weak self] (data, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
                self?.imageView.isHidden = false
            }
        }
    }

}


extension ViewController {

    @IBAction func hideImage(_ sender: UIButton) {
        imageView.isHidden = true
        imageView.image = nil
    }

    @IBAction func sendNotification(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        
        let notificationRequestId = "notificationRequestId"
        let notificationAttachmentId = "notificationAttachmentId"
        
        let notificationContent = { () -> UNMutableNotificationContent in
            let attachment: UNNotificationAttachment?
            do {
                attachment = try UNNotificationAttachment(identifier: notificationAttachmentId, url: MediaType.datBoi.appUrl(), options: nil)
            } catch {
                attachment = nil
            }
            
            let content = UNMutableNotificationContent()
            content.title = NSString.localizedUserNotificationString(forKey: "Hello!", arguments: nil)
            content.body = NSString.localizedUserNotificationString(forKey: "Hi there!", arguments: nil)
            content.sound = UNNotificationSound.default()
            content.categoryIdentifier = NotificationType.notification.rawValue
            if let attachment = attachment {
                content.attachments = [attachment]
            }
            return content
        }()
        
        let notificationRequest = UNNotificationRequest(identifier: notificationRequestId, content: notificationContent, trigger: UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false))
        center.add(notificationRequest) { (error) in
            if let error = error {
                print("\(error)")
            }
        }
    }

}
