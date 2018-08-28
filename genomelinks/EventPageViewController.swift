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
    let types = ["Depression", "Intelligence", "Openness", "Extraversion"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = statsTableView.dequeueReusableCell(withIdentifier: "statsTableCell") as! eventStatsTableViewCell
        cell.genomeName.text = types[indexPath.row]
        
        switch indexPath.row {
        case 0:
            var depression : Double = Double(event?.depression ?? 0)
            depression = depression / Double((event?.total)!)
            let avg = String(format: "%.1f", depression)
            cell.genomeCount.text = "\(avg)"
        case 1:
            var intelligence : Double = Double(event?.intelligence ?? 0)
            intelligence = intelligence / Double((event?.total)!)
            let avg = String(format: "%.1f", intelligence)
            cell.genomeCount.text = "\(avg)"
        case 2:
            var openness : Double = Double(event?.openness ?? 0)
            openness = openness / Double((event?.total)!)
            let avg = String(format: "%.1f", openness)
            cell.genomeCount.text = "\(avg)"
        default:
            var extraversion : Double = Double(event?.extraversion ?? 0)
            extraversion = extraversion / Double((event?.total)!)
            let avg = String(format: "%.1f", extraversion)
            cell.genomeCount.text = "\(avg)"
        }
        return cell
    }
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var numberOfPeopleAttending: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var statsTableView: UITableView!
    
    @IBAction func attendEventButton(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        if defaults.object(forKey: event!.id) == nil {
            defaults.set(true, forKey: event!.id)
            // add user to users object
            Database
                .database()
                .reference(withPath: "users")
                .child(defaults.string(forKey: "uid")!)
                .child("events")
                .updateChildValues([
                    "\(event!.id)" : true
                    ])
            
            
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
        eventDescription.text = event?.description ?? ""

    }
}
