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
import AVFoundation

private var itemStatusContext = 0

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    @IBOutlet var playerView: PlayerView!
    
    
    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = notification.request.content.body
        self.extensionContext // TODO
        loadAssetFromFile()
        
//        URLSession.getImage(atURL: MediaType.datBoiFullRemote.url()) { [weak self] (data, error) in
//            if let _ = error {
//                return
//            }
//            guard let data = data else {
//                return
//            }
//            DispatchQueue.main.async {
//                self?.imageView?.image = UIImage(data: data)
//                self?.imageView?.isHidden = false
//            }
//        }

    }
    
    var mediaPlayPauseButtonType: UNNotificationContentExtensionMediaPlayPauseButtonType {
        get {
            return UNNotificationContentExtensionMediaPlayPauseButtonType.overlay
        }
    }

    var mediaPlayPauseButtonFrame: CGRect {
        get {
            let centerX = Double(view.frame.width) / 2.0
            let centerY = Double(view.frame.height) / 2.0
            let buttonWidth = 50.0
            let buttonHeight = 50.0
            return CGRect(x: centerX - buttonWidth/2.0, y: centerY - buttonHeight/2.0, width: buttonWidth, height: buttonHeight)
        }
    }

    public func mediaPlay() {
        player?.play()
    }
    
    public func mediaPause() {
        player?.pause()
    }
    
    func myTestFunc() {
        return
    }
    
    func loadAssetFromFile() {
        
        let fileURL = MediaType.movieFullLocal.url()
        //let asset = AVURLAsset(url: fileURL)
        //let tracksKey = "tracks"
        
/*        asset.loadValuesAsynchronously(forKeys: [tracksKey]) {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                
                var error: NSError?
                let status = asset.statusOfValue(forKey: tracksKey, error: &error)
                if status == AVKeyValueStatus.loaded {
                    strongSelf.playerItem = AVPlayerItem(asset: asset)
                    strongSelf.playerItem!.addObserver(strongSelf, forKeyPath: "status", options: NSKeyValueObservingOptions.initial, context: &itemStatusContext)
                    NotificationCenter.default.addObserver(strongSelf, selector: #selector(NotificationViewController.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: strongSelf.playerItem)
                    strongSelf.player = AVPlayer(playerItem: strongSelf.playerItem)
                    strongSelf.playerView.player = strongSelf.player
                }
            }
        }*/
    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: AnyObject?, change: [NSKeyValueChangeKey : AnyObject]?, context: UnsafeMutablePointer<Swift.Void>?) {
//        if context == &itemStatusContext {
//            DispatchQueue.main.async {
//                // TODO
//            }
//        }
//        else {
//            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
//        }
//    }
    
    func playerItemDidReachEnd() {
        
    }

}
