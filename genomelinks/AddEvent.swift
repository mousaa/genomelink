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
    @IBOutlet weak var eventNameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    
    
    override func viewDidLoad() {
        navigationItem.title = "Add Event"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createEvent))
    }
    
    @objc func createEvent() {
        let eventName = eventNameLabel!.text
        
        Database.database()
        .reference()
        .child("events")
        .childByAutoId()
        .setValue(["name": eventName])
    }
}

