//
//  runAppViewController.swift
//  procrash
//
//  Created by Amanda Zhu on 2/22/20.
//  Copyright © 2020 Amanda Zhu. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class runAppViewController: UIViewController {

var ref: DatabaseReference!
var databaseHandle: DatabaseHandle?
var databaseHandle1: DatabaseHandle?
var isOn = String()

    @IBOutlet weak var onButton: UIButton!
    @IBAction func runButton(_ sender: Any) {
 
        ref = Database.database().reference()
        
        if isOn=="1"{
            self.ref.child("Status").child("IsOn").setValue("0")
            onButton.setTitle("Stop", for:.normal)
        }
        else if isOn=="0"{
            self.ref.child("Status").child("IsOn").setValue("1")
            onButton.setTitle("Start", for:.normal)

        }
        databaseHandle = ref?.child("Status").observe(.childAdded, with: {(snapshot) in
        let post = snapshot.value as? String
            print(snapshot)
            if let actual = post
            {
                self.isOn = actual
                print("Goodbye World")
            }
        })
        //self.ref.child("IsOn").getValue()
    }
    @IBOutlet weak var roundedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roundedButton.layer.cornerRadius = 23
        ref = Database.database().reference()
        databaseHandle = ref?.child("Status").observe(.childAdded, with: {(snapshot) in
        let post = snapshot.value as? String
            print(snapshot)
            if let actual = post
            {
                self.isOn = actual
                print("Goodbye World")
            }
        })
        
//        databaseHandle1 = ref?.child("Status").observe(.childChanged, with: {(snapshot) in
//        let post = snapshot.value as? String
//            print(snapshot)
//            if let actual = post
//            {
//                self.isOn = actual
//                print("Goodbye World")
//            }
//        })

        // Do any additional setup after loading the view.
    }
    
//add datasource and delegate?
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
