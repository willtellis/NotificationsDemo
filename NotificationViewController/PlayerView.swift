//
//  PlayerView.swift
//  NotificationsDemo
//
//  Created by Will Ellis on 8/17/16.
//  Copyright © 2016 Will Ellis. All rights reserved.
//

import Foundation

import UIKit
import AVFoundation

class PlayerView : UIView {
        
    var player: AVPlayer? {
        get {
            return (self.layer as? AVPlayerLayer)?.player
        }
        
        set {
            (self.layer as? AVPlayerLayer)?.player = newValue
        }
    }

    var layerClass: AnyClass {
        get {
            return AVPlayerLayer.self
        }
    }
    
}
