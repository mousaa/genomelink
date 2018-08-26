//
//  EventPageViewController.swift
//  genomelinks
//
//  Created by ahmed mousa on 2018-08-22.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import FirebaseDatabase

class eventStatsTableViewCell: UITableViewCell {
    @IBOutlet weak var genomeName: UILabel!
    @IBOutlet weak var genomeCount: UILabel!
}


class EventPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let types = ["depression", "intelligence", "openness", "extraversion"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = statsTableView.dequeueReusableCell(withIdentifier: "statsTableCell") as! eventStatsTableViewCell
        cell.genomeName.text = types[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.genomeCount.text = "\(event?.depression ?? 0)"
        case 1:
            cell.genomeCount.text = "\(event?.intelligence ?? 0)"
        case 2:
            cell.genomeCount.text = "\(event?.openness ?? 0)"
        default:
            cell.genomeCount.text = "\(event?.extraversion ?? 0)"
        }
        return cell
    }
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var numberOfPeopleAttending: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var statsTableView: UITableView!
    
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
        
        event?.intelligence = (event?.intelligence)! + Int(defaults.string(forKey: "intelligence")!)!
        event?.depression = (event?.depression)! + Int(defaults.string(forKey: "depression")!)!
        event?.openness = (event?.openness)! + Int(defaults.string(forKey: "openness")!)!
        event?.extraversion = (event?.extraversion)! + Int(defaults.string(forKey: "extraversion")!)!
        event?.total += 1
        
        Database
            .database()
            .reference(withPath: "events")
            .child((event?.id)!)
            .updateChildValues([
                "total" : (event?.total)!,
                "intelligence": (event?.intelligence)!,
                "depression": (event?.depression)!,
                "openness": (event?.openness)!,
                "extraversion": (event?.extraversion)!
            ])
        statsTableView.reloadData()
        numberOfPeopleAttending.text = "\(event?.total ?? 0) attending"
    }
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statsTableView.tableFooterView = UIView()
        let formatter = DateFormatter()
        formatter.isLenient = true
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        let myDate = formatter.date(from: (event?.date)!)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd\n'at' h a"
        let displayDate = dateFormatter.string(from: myDate)
        
        location.text = event?.location ?? ""
        date.text = displayDate
        numberOfPeopleAttending.text = "\(event?.total ?? 0) attending"
        eventName.text = event?.name ?? ""

    }
}
