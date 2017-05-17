//
//  Event.swift
//  UICollectionViewEvent
//
//  Created by Cntt08 on 5/17/17.
//  Copyright © 2017 healer. All rights reserved.
//

import Foundation
import UIKit


// Class contain attributes of event
class Event{
    var eventName: String
    var eventContent: String
    static var isLoadData = false;
    static var event: Event?
    static var Day: String?
    init(name: String, content: String) {
        eventName = name
        eventContent = content
    }
    func getEventName() -> String{
        return eventName
    }
    
    func setEventName(eventContent : String){
        self.eventContent = eventContent
    }
    
    func getEventContent() -> String{
        return eventContent;
    }
    
    func setEventName(eventName: String)  {
        self.eventName = eventName
    }
    
}
