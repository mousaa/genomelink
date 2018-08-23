//
//  EventPageViewController.swift
//  genomelinks
//
//  Created by ahmed mousa on 2018-08-22.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EventPageViewController: UIViewController {
    @IBOutlet weak var location: UILabel! {
        didSet {
            location.text = event?.location ?? ""
        }
    }
    @IBOutlet weak var date: UILabel! {
        didSet {
            date.text = event?.date
        }
    }
    @IBOutlet weak var numberOfPeopleAttending: UILabel! {
        didSet {
            numberOfPeopleAttending.text = "\(event?.total ?? 0) attending"
        }
        
    }
    @IBOutlet weak var eventName: UILabel! {
        didSet {
            eventName.text = event?.name ?? ""
        }
    }
    
    @IBAction func attendEventButton(_ sender: UIButton) {
        // add user to users object
        Database
        .database()
        .reference(withPath: "users")
        .child(UserDefaults.standard.string(forKey: "uid")!)
        .child("events")
        .updateChildValues([
            "\(event!.id)" : true
        ])
        
    }
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
