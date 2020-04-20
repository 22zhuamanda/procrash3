//
//  BlacklistViewController.swift
//  procrash
//
//  Created by Amanda Zhu on 2/22/20.
//  Copyright © 2020 Amanda Zhu. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class BlacklistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var blackTableView: UITableView!
    
    var black_sites = [Int:String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let database = Database.database().reference()
        database.child("Blacklist/-M1rexaILOfsIJ1oM_GI/Sites").observeSingleEvent(of: .value){(snapshot) in
            self.black_sites = ((snapshot.value as? [Int:Any])! as! [Int : String])
       
        }
        
        blackTableView.dataSource = self
        blackTableView.delegate = self

        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 50
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "blackCell") as! blackCell
        
        //let website = //get website from database
        //let type = //get type from databse
      //  cell.websiteLabel!.text = website
        //cell.typeLabel.text = type
        
          cell.textLabel?.text = "row:\(indexPath.row)"
          return cell
      }
      
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
