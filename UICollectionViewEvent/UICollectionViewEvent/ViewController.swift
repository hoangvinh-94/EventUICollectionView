//
//  ViewController.swift
//  UICollectionViewEvent
//
//  Created by healer on 5/6/17.
//  Copyright © 2017 healer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // declare Array contain data days in week
    var DayOfWeek : [DayOfWeekEvent] = [
    ]

    
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        DayOfWeek = dataMain()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(Event.isLoadData){
            let event: Event = Event.event!
            let day: String = Event.Day!
                   switch day {
        case "Monday":
            DayOfWeek[0].eventsInDay.append(event)
            break;
        case "Tuesday":
            DayOfWeek[1].eventsInDay.append(event)
            break;
        case "Wednesday":
           
            DayOfWeek[2].eventsInDay.append(event)
            break;
        case "Thursday":
           
            DayOfWeek[3].eventsInDay.append(event)
            break;
        case "Friday":
      
            DayOfWeek[4].eventsInDay.append(event)
            break;
        case "Saturday":
     
            DayOfWeek[5].eventsInDay.append(event)
            break;
        case "Sunday":
    
            DayOfWeek[6].eventsInDay.append(event)
            break;
        default:
            break;
        }
            Event.isLoadData = false
            collectionView.reloadData()
        }
    }
    
    // number of section in Array
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DayOfWeek.count
    }
    // number of item in a section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DayOfWeek[section].eventsInDay.count
    }
    // get value of TitleEvent and dayEvent each item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCollectionViewCell
            cell.TitleEvent.text = DayOfWeek[indexPath.section].eventsInDay[indexPath.row].getEventName()
        return cell
    }
    // get dayofweek value assi
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! HeaderSectionCollectionReusableView
        
        header.HeaderText.text = DayOfWeek[indexPath.section].dayOfWeek
        header.NumberText.text = String( DayOfWeek[indexPath.section].eventsInDay.count)
        return header
    }
    
// get data and pass to DetailEvent
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Details"){
                let eventDetail = segue.destination as! DetailEventViewController
                if let cell = sender as? UICollectionViewCell,let indexPath = collectionView!.indexPath(for: cell){
                    eventDetail.event = DayOfWeek[indexPath.section].eventsInDay[indexPath.row]
                    eventDetail.day = DayOfWeek[indexPath.section].dayOfWeek
                }
        }
        if(segue.identifier == "AddEvent"){
           //let addEvent = segue.destination as! AddEventViewController
            //addEvent.DayOfWeek1 = dataMain()
        }
    }
    
    
    
    // get Data
    func dataMain() -> [DayOfWeekEvent]{
        
        
        // Declare availables and events for Monday
        var Mon : DayOfWeekEvent
        var MonEvents = [Event]()
        MonEvents.append(Event(name : "Event 1 for Monday", content : "Content for Event 1 of Monday"))
        MonEvents.append(Event(name : "Event 2 for Monday", content : "Content for Event 2 of Monday"))
        MonEvents.append(Event(name : "Event 3 for Monday", content : "Content for Event 3 of Monday"))
        Mon = DayOfWeekEvent(dayofweek : "Monday", events : MonEvents)
        
        // Declare availables and events for Tuesday
        var Tue : DayOfWeekEvent
        var TueEvents = [Event]()
        TueEvents.append(Event(name : "Event for Tuesday 1", content : "Content for Event 1 of Tuesday"))
        TueEvents.append(Event(name : "Event for Tuesday 2", content : "Content for Event 2 of Tuesday"))
        Tue = DayOfWeekEvent(dayofweek : "Tuesday", events : TueEvents)
        
        // Declare availables and events for Wednesday
        var Wed : DayOfWeekEvent
        var WedEvents = [Event]()
        WedEvents.append(Event(name : "Event for Wednesday 1", content : "Content for Event 1 of Wednesday"))
        WedEvents.append(Event(name : "Event for Wednesday 2", content : "Content for Event 2 of Wednesday"))
        WedEvents.append(Event(name : "Event for Wednesday 3", content : "Content for Event 3 of Wednesday"))
        WedEvents.append(Event(name : "Event for Wednesday 4", content : "Content for Event 4 of Wednesday"))
        WedEvents.append(Event(name : "Event for Wednesday 5", content : "Content for Event 5 of Wednesday"))
        Wed = DayOfWeekEvent(dayofweek : "Wednesday", events : WedEvents)
        
        // Declare availables and events for Thursday
        var Thu : DayOfWeekEvent
        var ThuEvents = [Event]()
        ThuEvents.append(Event(name : "Event for Thursday 1", content : "Content for Event 1 of Thursday"))
        ThuEvents.append(Event(name : "Event for Thursday 2", content : "Content for Event 2 of Thursday"))
        
        Thu = DayOfWeekEvent(dayofweek : "Thursday", events : ThuEvents)
        
        // Declare availables and events for Friday
        var Fri : DayOfWeekEvent
        var FriEvents = [Event]()
        FriEvents.append(Event(name : "Event for Friday 1", content : "Content for Event 1 of Friday"))
        FriEvents.append(Event(name : "Event for Friday 2", content : "Content for Event 2 of Friday"))
        FriEvents.append(Event(name : "Event for Friday 3", content : "Content for Event 3 of Friday"))
        
        
        FriEvents.append(Event(name : "Event for Friday 4", content : "Content for Event 4 of Friday"))
        
        FriEvents.append(Event(name : "Event for Friday 5", content : "Content for Event 5 of Friday"))
        
        FriEvents.append(Event(name : "Event for Friday 6", content : "Content for Event 6 of Friday"))
        Fri = DayOfWeekEvent(dayofweek : "Friday", events : WedEvents)
        
        
        // Declare availables and events for Saturday
        var Sat : DayOfWeekEvent
        var SatEvents = [Event]()
        SatEvents.append(Event(name : "Event for Saturday 1", content : "Content for Event 1 of Saturday"))
        SatEvents.append(Event(name : "Event for Saturday 2", content : "Content for Event 2 of Saturday"))
        SatEvents.append(Event(name : "Event for Saturday 3", content : "Content for Event 3 of Saturday"))
        
        
        SatEvents.append(Event(name : "Event for Saturday 4", content : "Content for Event 4 of Saturday"))
        
        
        Sat = DayOfWeekEvent(dayofweek : "Saturday", events : SatEvents)
        
        
        // Declare availables and events for Sunday
        var Sun : DayOfWeekEvent
        var SunEvents = [Event]()
        SunEvents.append(Event(name : "Event for Sunday 1", content : "Content for Event 1 of Sunday"))
        SunEvents.append(Event(name : "Event for Sunday 2", content : "Content for Event 2 of Sunday"))
        SunEvents.append(Event(name : "Event for Sunday 3", content : "Content for Event 3 of Sunday"))
        
        
        SunEvents.append(Event(name : "Event for Sunday 4", content : "Content for Event 4 of Sunday"))
        
        SunEvents.append(Event(name : "Event for Sunday 5", content : "Content for Event 5 of Sunday"))
        
        SunEvents.append(Event(name : "Event for Sunday 6", content : "Content for Event 6 of Sunday"))
        SunEvents.append(Event(name : "Event for Sunday 7", content : "Content for Event 7 of Sunday"))
        
        SunEvents.append(Event(name : "Event for Sunday 8", content : "Content for Event 8 of Sunday"))
        Sun = DayOfWeekEvent(dayofweek : "Sunday", events : SunEvents)
        
        
        // Return Array type DayOfWeekEvent
        let WeekEvent = [Mon,Tue,Wed,Thu,Fri,Sat,Sun]
        return WeekEvent
    }

    

}

