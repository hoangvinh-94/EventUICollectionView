//
//  AddEventViewController.swift
//  UICollectionViewEvent
//
//  Created by healer on 5/6/17.
//  Copyright © 2017 healer. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    var DayOfWeek1 = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    @IBOutlet var titleEvent: UITextField!
    @IBOutlet var dayEvent: UILabel!
    
    @IBOutlet var contentEvent: UITextView!
    @IBOutlet var dayOfWeekText: UITextField!
    @IBOutlet var dropDown: UIPickerView!
    @IBOutlet var saveEvent: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "ListEvent"){
            let vc = segue.destination as! ViewController
            vc.newEvent?.eventName = titleEvent.text!
            vc.newEvent?.eventContent = contentEvent.text
            vc.newEvent?.eventDay = dayEvent.text!
            vc.dayString = dayOfWeekText.text
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DayOfWeek1.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return DayOfWeek1[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.dayOfWeekText.text = DayOfWeek1[row]
        self.dropDown.isHidden = true
        self.titleEvent.isHidden = false
        self.dayEvent.isHidden = false
        self.contentEvent.isHidden = false
        self.saveEvent.isHidden = false
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.dayOfWeekText){
            self.dropDown.isHidden = false

        }
    }
}
