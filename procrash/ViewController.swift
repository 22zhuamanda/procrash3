//
//  ViewController.swift
//  procrash
//
//  Created by Amanda Zhu on 2/22/20.
//  Copyright © 2020 Amanda Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func enterButton(_ sender: UIButton) {
        performsegue(withIdentifier: "enter", self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

