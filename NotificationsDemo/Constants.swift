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
    case animatedContentExtension = "animatedNotificationContentExtensionId"
}

enum ActionType: String {
    case waddup = "actionIdWaddup"
    case holla = "actionIdHolla"
    case yo = "actionIdYo"
    case word = "actionIdWord"
    case sup = "actionIdSup"
}

enum MediaType {
    case datBoiThumbnail
    case datBoiFullLocal
    case datBoiFullRemote
    case movieFullLocal
    case audioFullLocal
    
    init?(url: URL) {
        switch url {
        case MediaType.datBoiThumbnail.url():
            self = .datBoiThumbnail
        case MediaType.datBoiFullLocal.url():
            self = .datBoiFullLocal
        case MediaType.datBoiFullRemote.url():
            self = .datBoiFullRemote
        case MediaType.movieFullLocal.url():
            self = .datBoiFullRemote
        case MediaType.audioFullLocal.url():
            self = .datBoiFullRemote
        default:
            return nil
        }
    }
    
    func url() -> URL {
        switch self {
        case .datBoiThumbnail:
//<<<<<<< HEAD
//            return Bundle.main.url(forResource:"datboi", withExtension: "png")!
//        case .datBoiFullLocal:
//            return Bundle.main.url(forResource:"datboi", withExtension: "gif")!
//=======
            return Bundle.main.url(forResource: "datboi", withExtension: "png")!
        case .datBoiFullLocal:
            return Bundle.main.url(forResource: "datboi", withExtension: "gif")!
//>>>>>>> a126a57... Exercise capabilities
        case .datBoiFullRemote:
            return URL(string: "https://i.giphy.com/yDTWAecZcB2Jq.gif")!
        case .movieFullLocal:
            return Bundle.main.url(forResource: "will", withExtension: "mov")!
        case .audioFullLocal:
            return Bundle.main.url(forResource: "testing", withExtension: "m4a")!
        }
    }
}
