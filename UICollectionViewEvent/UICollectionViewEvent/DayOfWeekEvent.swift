//
//  DayOfWeekEvent.swift
//  UICollectionViewEvent
//
//  Created by Cntt08 on 5/17/17.
//  Copyright © 2017 healer. All rights reserved.
//

import Foundation
import UIKit


// Contain attributes of Day in Week
class DayOfWeekEvent {
    
    var dayOfWeek : String
    var eventsInDay : [Event]
    
    
    init(dayofweek : String, events : [Event]) {
        dayOfWeek = dayofweek
        eventsInDay = events
    }
    
    func getEvents() -> [Event]{
        return eventsInDay
    }
    
    func setEvents(events : [Event]){
        eventsInDay = events
    }
    
    func getDayOfWeek() -> String{
        return dayOfWeek;
    }
    
    func setDayOfWeek(dayofweek : String)  {
        dayOfWeek = dayofweek
    }
    
}
