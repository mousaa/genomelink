//
//  AddEvent.swift
//  genomelinks
//
//  Created by ahmed mousa on 2018-08-13.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddEvent: UIViewController {
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventLocation: UITextField!
    @IBOutlet weak var eventDescription: UITextField!
    @IBOutlet weak var eventDate: UIDatePicker! {
        didSet {
            eventDate.minimumDate = Date()
        }
    }
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEvent))
        navigationItem.rightBarButtonItem?.title = "Create"
    }
    
    @objc func addEvent() {
        Database.database()
        .reference()
        .child("events")
        .childByAutoId()
        .updateChildValues([
            "name": eventName.text!,
            "description": eventDescription.text!,
            "location": eventLocation.text!
        ])
        
        navigationController?.popViewController(animated: true)
    }
}

