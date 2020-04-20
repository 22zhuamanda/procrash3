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
    
    
    var black_sites = [Int:String]()
    var databaseHandle: DatabaseHandle!
    var ref: DatabaseReference!
    var siteNames = [NSDictionary]()
    var postData = [String]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var blackTableView: UITableView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBAction func add(_ sender: Any) {
        print(searchBar.text)
        print("Hello")
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        print("Hello World")
        print(siteNames)
    }
    
    @IBAction func testingButton(_ sender: Any) {
   for (items) in siteNames
   {
    for (_,value) in items {
        if let content = items["Sites"] as? [String]
        {
            print(content)
            for i in content
            {
                postData.append(i)
            }
        }
    }
    }
    print(postData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let ref = Database.database().reference(withPath: "Blacklist")
        
        //print(ref)
      
        ref = Database.database().reference()
        databaseHandle = ref?.child("Blacklist").observe(.childAdded, with: { (snapshot) in
    let postDict = snapshot.value as? NSDictionary
            print(snapshot.value)
            
    //conditional binding
    if let actualPost = postDict {
        self.siteNames.append(actualPost)
            print("Hi World")} })
    //tableView.reloadData()


        blackTableView.dataSource = self
        blackTableView.delegate = self

        
        // Do any additional setup after loading the view.
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
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return postData.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
    cell.textLabel?.text = postData[indexPath.row]
      return cell
    }
    //let website = //get website from database
    //let type = //get type from databse
  //  cell.websiteLabel!.text = website
    //cell.typeLabel.text = type
    

  }

