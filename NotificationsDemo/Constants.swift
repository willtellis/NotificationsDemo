//
//  Constants.swift
//  NotificationsDemo
//
//  Created by Will Ellis on 6/16/16.
//  Copyright © 2016 Will Ellis. All rights reserved.
//

import Foundation

enum NotificationType: String {
    case plain = "notificationPlainId"
    case serviceExtension = "notificationServiceExtensionId"
    case contentExtension = "notificationContentExtensionId"
}

enum ActionType: String {
    case waddup = "actionIdWaddup"
}

enum MediaType {
    case datBoiThumbnail
    case datBoiFullLocal
    case datBoiFullRemote
    
    init?(url: URL) {
        switch url {
        case MediaType.datBoiThumbnail.url():
            self = .datBoiThumbnail
        case MediaType.datBoiFullLocal.url():
            self = .datBoiFullLocal
        case MediaType.datBoiFullRemote.url():
            self = .datBoiFullRemote
        default:
            return nil
        }
    }
    
    func url() -> URL {
        switch self {
        case .datBoiThumbnail:
            return Bundle.main.urlForResource("datboi", withExtension: "png")!
        case .datBoiFullLocal:
            return Bundle.main.urlForResource("datboi", withExtension: "gif")!
        case .datBoiFullRemote:
            return URL(string: "https://i.giphy.com/yDTWAecZcB2Jq.gif")!
        }
    }
}
