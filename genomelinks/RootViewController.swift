//
//  RootViewController.swift
//  genomelinks
//
//  Created by Jason Long on 2018-08-13.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import OAuthSwift

class RootViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension RootViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(180)
        }
        return CGFloat(60)
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
        
        cell.eventName.text = "hehexd"
        cell.eventDetail.text = "hehehehehehhehe"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 5
    }
}
