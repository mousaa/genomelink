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
    let defaults = UserDefaults.standard
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
        let intelligence = Int(defaults.string(forKey: "intelligence")!) ?? 0
        let depression = Int(defaults.string(forKey: "depression")!) ?? 0
        let openness = Int(defaults.string(forKey: "openness")!) ?? 0
        let extraversion = Int(defaults.string(forKey: "extraversion")!) ?? 0
        Database.database()
        .reference()
        .child("events")
        .childByAutoId()
        .updateChildValues([
            "name": eventName.text!,
            "description": eventDescription.text!,
            "location": eventLocation.text!,
            "intelligence": intelligence,
            "depression": depression,
            "openness": openness,
            "extraversion": extraversion,
            "total": 1
        ])
        
        navigationController?.popViewController(animated: true)
    }
}

