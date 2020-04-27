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

class BlacklistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    
 
    
 
    
    
    var black_sites = [Int:String]()
    var databaseHandle: DatabaseHandle!
    var ref: DatabaseReference!
    var siteNames = [NSDictionary]()
    var postData = [String]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var blackTableView: UITableView!
    
    var searchSite = [String]()
    var searching = false
    var dbkey = "-M1rexaILOfsIJ1oM_G2"

    
    @IBOutlet weak var addButton: UIBarButtonItem!
 
    
    @IBAction func addItem(_ sender: Any) {
        //1. Create the alert controller.
    print("Adding Item")
        let alert = UIAlertController(title: "Add a new Site", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
        textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "ADD", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            self.ref = Database.database().reference()
            
            
                
                    print("Text field: \(textField?.text)")
                
            self.ref.child(dbkey).child("Sites").push(textField?.text)
                      //SEND TEXT TO DATABASE
            //Reload the list so that it has current information
                
                }))
        
    // 4. Present the alert.
    self.present(alert, animated: true, completion: nil)
        
        
        
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
      
        blackTableView.dataSource = self
        blackTableView.delegate = self
        searchBar.delegate = self
      
        ref = Database.database().reference()
        databaseHandle = ref?.child("Blacklist").observe(.childAdded, with: { (snapshot) in
    let postDict = snapshot.value as? NSDictionary
            print(snapshot.value)
            
    //conditional binding
    if let actualPost = postDict {
        self.siteNames.append(actualPost)
        
         
         for (_,value) in actualPost {
             if let content = actualPost["Sites"] as? [String]
             {
                 print(content)
                 for i in content
                 {
                    if(self.postData.contains(i) == false)
                    {
                        self.postData.append(i)
                        self.blackTableView.reloadData()
                    }
                  

                 }
             }
         }
         

            } }
        )

        
        // Do any additional setup after loading the view.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchSite = postData.filter({$0.prefix(searchText.count) == searchText.lowercased()})
        searching = true
        blackTableView.reloadData()
    }
    
    
    
    //var searchSite
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searching)
        {
            return searchSite.count
        }
        else
        {
            return postData.count
        }
        
        
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "blackCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        
        if searching
        {
            cell?.textLabel?.text = searchSite[indexPath.row]
        }
        else
        {
            cell?.textLabel?.text = postData[indexPath.row]
        }
        
        
        
        return cell!
     }
    
    
}


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 */



