//
//  ViewController.swift
//  genomelinks
//
//  Created by ahmed mousa on 2018-08-17.
//  Copyright © 2018 Ahmed Mousa. All rights reserved.
//

import UIKit

extension UIViewController {
    
    #if DEBUG
    @objc func injected() {
        
        for subview in self.view.subviews {
            subview.removeFromSuperview()
        }
        if let sublayers = self.view.layer.sublayers {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }
        }
        
        viewDidLoad()
    }
    #endif
}
