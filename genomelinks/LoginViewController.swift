//
//  LoginViewController.swift
//  genomelinks
//
//  Created by Ivan Yung on 2018-08-14.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.open(URL(string: "https://genomemeetup.herokuapp.com/")!)
    }
}
