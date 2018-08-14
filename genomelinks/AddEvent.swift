//
//  AddEvent.swift
//  genomelinks
//
//  Created by ahmed mousa on 2018-08-13.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import OAuthSwift

class AddEvent: UIViewController {
    
    @IBAction func callAPI(_ sender: Any) {
        UIApplication.shared.open(URL(string: "http://127.0.0.1:5000/")!)
    }
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem()
        navigationItem.rightBarButtonItem?.title = "Create"
        navigationItem.title = "Add Event"
        navigationItem.backBarButtonItem = UIBarButtonItem()
        navigationItem.backBarButtonItem?.title = "Cancel"
    }
}

