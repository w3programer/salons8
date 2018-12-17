//
//  ViewController.swift
//  Salonat
//
//  Created by salman on 10/19/18.
//  Copyright © 2018 salman. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class LoginVC: UIViewController {

    @IBOutlet weak var BUMenu: UIBarButtonItem!
    @IBOutlet weak var TFPassword: UITextField!
    @IBOutlet weak var TFEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Helper.getdevicestoken())
        
       
        TFEmail.setLeftViewFAIcon(icon: .FAUserO, leftViewMode: .always, textColor: .lightGray, backgroundColor: .clear, size: nil)
        TFPassword.setLeftViewFAIcon(icon: .FALock, leftViewMode: .always, textColor: .lightGray, backgroundColor: .clear, size: nil)


        
        
        BUMenu.setFAIcon(icon: .FANavicon, iconSize: 30)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func BUSkip(_ sender: UIButton) {
    }
    
    
    @IBAction func BULogin(_ sender: UIButton) {
    }
    @IBAction func BUForget(_ sender: UIButton) {
    }
}

