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
        
        let defaults = UserDefaults.standard
        
        let intelligence = (event?.intelligence)! + Int(defaults.string(forKey: "intelligence")!)!
        let depression = (event?.depression)! + Int(defaults.string(forKey: "depression")!)!
        let openness = (event?.openness)! + Int(defaults.string(forKey: "openness")!)!
        let extraversion = (event?.extraversion)! + Int(defaults.string(forKey: "extraversion")!)!
        event?.total += 1
        
        Database
            .database()
            .reference(withPath: "events")
            .child((event?.id)!)
            .updateChildValues([
                "total" : (event?.total)!,
                "intelligence": intelligence,
                "depression": depression,
                "openness": openness,
                "extraversion": extraversion
            ])
        
        numberOfPeopleAttending.text = "\(event?.total ?? 0) attending"
    }
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
