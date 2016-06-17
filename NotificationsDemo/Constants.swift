//
//  Constants.swift
//  NotificationsDemo
//
//  Created by Will Ellis on 6/16/16.
//  Copyright © 2016 Will Ellis. All rights reserved.
//

import Foundation

enum NotificationType: String {
    case notification = "notificationId"
}

enum ActionType: String {
    case waddup = "actionIdWaddup"
}

enum MediaType: String {
    case datBoi = "demo://datboi"
    
    init?(appUrl: URL) {
        guard let urlString = appUrl.absoluteString, let mediaType = MediaType(rawValue: urlString) else {
            return nil
        }
        self = mediaType
    }
    
    func appUrl() -> URL {
        switch self {
        case .datBoi:
            return URL(string: MediaType.datBoi.rawValue)!
        }
    }
    
    func url() -> URL?{
        switch self {
        case .datBoi:
            return URL(string: "https://i.giphy.com/yDTWAecZcB2Jq.gif")
        }
    }
}
