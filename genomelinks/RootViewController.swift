//
//  RootViewController.swift
//  genomelinks
//
//  Created by Jason Long on 2018-08-13.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import OAuthSwift
import FirebaseDatabase

class RootViewController: UITableViewController, TagsTableViewCellDelegate {
    
    
    private var allEvents: [Event] = []
    private var events: [Event] = []
    private var selectedCategory : String? = nil
    weak var delegate: TagsTableViewCellDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.tableFooterView = UIView()
    }
    
    private func updateView(){
        if self.selectedCategory == nil {
            self.events = allEvents
        } else if self.selectedCategory == "depression" {
            self.events = self.allEvents.sorted(by: { $0.depression > $1.depression })
        } else if self.selectedCategory == "extroversion" {
            self.events = self.allEvents.sorted(by: { $0.extraversion > $1.extraversion })
        } else if self.selectedCategory == "intelligence" {
            self.events = self.allEvents.sorted(by: { $0.intelligence > $1.intelligence })
        } else if self.selectedCategory == "openness" {
            self.events = self.allEvents.sorted(by: { $0.openness > $1.openness })
        }
        self.tableView.reloadData()
    }
    
    func setup() {        
        Database
        .database()
        .reference(withPath: "events")
        .observe(.value) { (snapshot) in
            // snapshot.children
            self.allEvents = []
            snapshot.children.forEach({ (data) in
                self.allEvents.append(Event(snapshot: data as! DataSnapshot)!)
            })
            self.updateView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "eventPage") {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! EventPageViewController
                vc.event = events[indexPath.row]
            }
        }
    }
    
    func updateSelectedCategory(_ category: String?) {
        if selectedCategory == category {
            selectedCategory = nil
        } else {
            selectedCategory = category!
        }
        updateView()
    }
}

@IBDesignable class PaddingLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 8.0
    @IBInspectable var bottomInset: CGFloat = 8.0
    @IBInspectable var leftInset: CGFloat = 8.0
    @IBInspectable var rightInset: CGFloat = 0.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}

extension RootViewController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        let label = PaddingLabel()
        label.text = (section == 0) ? "Tags" : "Events"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 22.0)
        label.frame = CGRect(x: 5, y: 5, width: tableView.frame.width, height: 35)
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Tags", for: indexPath) as! TagsTableViewCell
            cell.setCell()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Event", for: indexPath) as! EventTableViewCell
        let event = events[indexPath.row]
        cell.eventName.text = event.name
        cell.eventDetail.text = event.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return events.count
    }
}
