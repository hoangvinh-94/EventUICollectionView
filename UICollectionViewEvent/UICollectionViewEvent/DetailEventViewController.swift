//
//  DetailEventViewController.swift
//  UICollectionViewEvent
//
//  Created by healer on 5/6/17.
//  Copyright © 2017 healer. All rights reserved.
//

import UIKit

class DetailEventViewController: UIViewController {

     var event : Event?
    var day: String?
    
    @IBOutlet var titleText: UITextField!
    @IBOutlet var dayText: UITextField!
    @IBOutlet var contentText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleText.text = event?.getEventName()
        dayText.text = day
        contentText.text = event?.getEventContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
