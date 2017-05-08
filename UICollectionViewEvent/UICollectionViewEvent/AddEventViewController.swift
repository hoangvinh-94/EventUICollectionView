//
//  AddEventViewController.swift
//  UICollectionViewEvent
//
//  Created by healer on 5/6/17.
//  Copyright © 2017 healer. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UIPickerViewDelegate {

    
    @IBOutlet var titleEvent: UITextField!
    @IBOutlet var dayEvent: UILabel!
    @IBOutlet var contentEvent: UITextView!
    @IBOutlet var saveEvent: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dayEvent.text = Date().dayOfWeek()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Add New Event
    @IBAction func addEvent(_ sender: Any) {
        if(titleEvent.text!.isEmpty || contentEvent.text!.isEmpty){
            // add alert
            let alert = UIAlertController(title: "Notify", message: "Fill all information Please! ", preferredStyle: UIAlertControllerStyle.alert)
            // add action for alert created
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            // show alert
              self.present(alert, animated: true, completion: nil);
        }
        else{
            Event.isLoadData = true
            let event: Event = Event(name: titleEvent.text!, content: contentEvent.text!)
            Event.Day = Date().dayOfWeek()
            Event.event = event
            navigationController?.popViewController(animated: true)
            
        }
    }

}
extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
