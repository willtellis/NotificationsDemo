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
    @IBOutlet var attachmentSelectSegmentedControl: UISegmentedControl!
    
    weak var delegate = UIApplication.shared.delegate as? DatBoiProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        if let delegate = delegate , delegate.datBoiIsComing() {
            showImage()
        }
    }
    
    func showImage() {
        if let _ = imageView.image {
            imageView.isHidden = false
            return
        }
        URLSession.getImage(atURL: MediaType.datBoiFullRemote.url()) { [weak self] (data, error) in
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
        let notificationContent = { () -> UNMutableNotificationContent in
            
            let content = UNMutableNotificationContent()
            content.title = NSString.localizedUserNotificationString(forKey: "Here come dat boi!", arguments: nil)
            content.body = NSString.localizedUserNotificationString(forKey: "Oh snap!", arguments: nil)
            content.sound = UNNotificationSound.default()
            content.categoryIdentifier = NotificationType.plain.rawValue
            return content
        }()
        
        let notificationRequest = UNNotificationRequest(identifier: notificationRequestId, content: notificationContent, trigger: UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false))
        center.add(notificationRequest) { (error) in
            if let error = error {
                print("\(error)")
            }
        }
    }

    @IBAction func sendNotificationWithAttachment(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        
        let notificationRequestId = "notificationRequestId"
        let notificationAttachmentId = "notificationAttachmentId"
        
        let notificationContent = { () -> UNMutableNotificationContent in

            let url:URL
            switch self.attachmentSelectSegmentedControl.selectedSegmentIndex {
            case 0:
                url = MediaType.datBoiFullLocal.url()
            case 1:
                url = MediaType.audioFullLocal.url()
            case 2:
                url = MediaType.movieFullLocal.url()
            default:
                url = MediaType.movieFullLocal.url()
            }
            

            let attachment: UNNotificationAttachment?
            do {
                
                attachment = try UNNotificationAttachment(identifier: notificationAttachmentId, url: url, options: nil)
            } catch {
                attachment = nil
            }
            
            let content = UNMutableNotificationContent()
            content.title = NSString.localizedUserNotificationString(forKey: "Here come dat boi!", arguments: nil)
            content.subtitle = NSString.localizedUserNotificationString(forKey: "Subtitle", arguments: nil)
            content.body = NSString.localizedUserNotificationString(forKey: "Oh snap!", arguments: nil)
            content.sound = UNNotificationSound.default()
            content.categoryIdentifier = NotificationType.serviceExtension.rawValue
            if let attachment = attachment {
                content.attachments = [attachment]
            }
            return content
        }()
        
        let notificationRequest = UNNotificationRequest(identifier: notificationRequestId, content: notificationContent, trigger: UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false))
        center.add(notificationRequest) { (error) in
            if let error = error {
                print("\(error)")
            }
        }
    }
    
    
    
    @IBAction func sendNotificationToContentExtension(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        
        let notificationRequestId = "notificationRequestId"
        let notificationAttachmentId = "notificationAttachmentId"
        
        let notificationContent = { () -> UNMutableNotificationContent in
            
            let attachment: UNNotificationAttachment?
            do {
                attachment = try UNNotificationAttachment(identifier: notificationAttachmentId, url: MediaType.datBoiFullLocal.url(), options: nil)
            } catch {
                attachment = nil
            }
            
            let content = UNMutableNotificationContent()
            content.title = NSString.localizedUserNotificationString(forKey: "Here come dat boi!", arguments: nil)
            content.body = NSString.localizedUserNotificationString(forKey: "Oh snap!", arguments: nil)
            content.sound = UNNotificationSound.default()
            content.categoryIdentifier = NotificationType.contentExtension.rawValue
            if let attachment = attachment {
                content.attachments = [attachment]
            }
            return content
        }()
        
        let notificationRequest = UNNotificationRequest(identifier: notificationRequestId, content: notificationContent, trigger: UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false))
        center.add(notificationRequest) { (error) in
            if let error = error {
                print("\(error)")
            }
        }
    }
    
    @IBAction func sendAnimatedNotificationToContentExtension(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        
        let notificationRequestId = "notificationRequestId"
        
        let notificationContent = { () -> UNMutableNotificationContent in
            
            let content = UNMutableNotificationContent()
            content.title = NSString.localizedUserNotificationString(forKey: "Try some animation!", arguments: nil)
            content.body = NSString.localizedUserNotificationString(forKey: "Did it work?", arguments: nil)
            content.sound = UNNotificationSound.default()
            content.categoryIdentifier = NotificationType.animatedContentExtension.rawValue
            return content
        }()
        
        let notificationRequest = UNNotificationRequest(identifier: notificationRequestId, content: notificationContent, trigger: UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false))
        center.add(notificationRequest) { (error) in
            if let error = error {
                print("\(error)")
            }
        }
    }

    
    func send(notificationType: NotificationType) {
        let center = UNUserNotificationCenter.current()
        
        let notificationRequestId = "notificationRequestId"
        let notificationAttachmentId = "notificationAttachmentId"
        
        let notificationContent = { () -> UNMutableNotificationContent in
            
            let attachment: UNNotificationAttachment?
            do {
                attachment = try UNNotificationAttachment(identifier: notificationAttachmentId, url: MediaType.datBoiFullLocal.url(), options: nil)
            } catch {
                attachment = nil
            }
            
            let content = UNMutableNotificationContent()
            content.title = NSString.localizedUserNotificationString(forKey: "Oh snap!", arguments: nil)
            content.body = NSString.localizedUserNotificationString(forKey: "Here come dat boi!", arguments: nil)
            content.sound = UNNotificationSound.default()
            content.categoryIdentifier = notificationType.rawValue
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
