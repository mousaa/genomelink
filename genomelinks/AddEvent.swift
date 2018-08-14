//
//  AddEvent.swift
//  genomelinks
//
//  Created by ahmed mousa on 2018-08-13.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit

class AddEvent: UIViewController {
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem()
        navigationItem.rightBarButtonItem?.title = "Create"
        navigationItem.title = "Add Event"
        navigationItem.backBarButtonItem = UIBarButtonItem()
        navigationItem.backBarButtonItem?.title = "Cancel"
    }
}

