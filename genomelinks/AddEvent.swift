//
//  AddEvent.swift
//  genomelinks
//
//  Created by ahmed mousa on 2018-08-13.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import Eureka

class AddEvent: FormViewController {
    
    @IBAction func callAPI(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem()
        navigationItem.rightBarButtonItem?.title = "Create"
        navigationItem.title = "Add Event"
        navigationItem.backBarButtonItem = UIBarButtonItem()
        navigationItem.backBarButtonItem?.title = "Cancel"
        
        form +++ Section("Event Name" )
            <<< TextRow(){
                $0.placeholder = "My event"
            }
            +++ Section("Address")
            <<< TextRow(){
                $0.placeholder = "1 Hacker Way"
            }
            +++ Section("City")
            <<< TextRow(){
                $0.placeholder = "Menlo Park btw"
            }
            +++ Section("Label")
            <<< TextRow(){
                $0.placeholder = "hehexd"
            
        }
    }
}

