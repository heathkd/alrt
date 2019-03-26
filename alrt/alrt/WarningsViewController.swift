//
//  WarningsViewController.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-03-02.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import UIKit
import FirebaseDatabase

class WarningsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var warningsTable: UITableView!
    
    var ref:DatabaseReference?
    var warnings:[Warning] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        //ref?.child("Event").child("first").setValue("test")
        ref?.child("Event").observe(.childAdded, with: { (snapshot) in
            // code to execute when child node is added
            
            if let post = snapshot.value as? NSDictionary {
                
                if let id = post.object(forKey: "ID") as? NSNumber,
                    let sensor = post.object(forKey: "sensor") as? String,
                    let status = post.value(forKey: "status") as? String,
                    let timestamp = post.value(forKey: "timestamp") as? String {
                    
                    let warning = Warning(id: id, sensor: sensor, status: status, timestamp: timestamp)
                    self.warnings.append(warning)
                }
            }
            self.warningsTable.reloadData()
        })
    }
    
    let colours = [UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1),
                  UIColor(red: 219/255, green: 68/255, blue: 55/255, alpha: 1),
                  UIColor(red: 240/255, green: 160/255, blue: 0/255, alpha: 1),
                  UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1),] // blue, red, yellow, green
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return warnings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WarningTableViewCell

        cell.warning.text = warnings[indexPath.row].sensor + " " + warnings[indexPath.row].status
        cell.time.text = warnings[indexPath.row].timestamp
        cell.colour.backgroundColor = colours[indexPath.row % 4]
        cell.backgroundColor = UIColor(red: 197/255, green: 197/255, blue: 197/255, alpha: 0.2)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(65)
//    }
}

class Warning {
    
    let id: NSNumber
    let sensor: String
    let status: String
    let timestamp: String
    
    init (id: NSNumber, sensor: String, status: String, timestamp: String) {
        self.id = id
        self.sensor = sensor
        self.status = status
        self.timestamp = timestamp
    }
}
