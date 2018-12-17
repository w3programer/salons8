//
//  ProfileLocationVC.swift
//  Salonat
//
//  Created by salman on 10/26/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
protocol LocationViewDelegate: class {
    func sendToThirdViewController()
}

class ProfileLocationVC: UIViewController {
    
    weak var delegate: LocationViewDelegate? = nil

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
