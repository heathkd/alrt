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
    
    @IBOutlet weak var inProgressTable: UITableView!
    @IBOutlet weak var completedTable: UITableView!
    
    var ref:DatabaseReference?
    var inProgressWarnings:[Warning] = []
    var completedWarnings:[Warning] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inProgressTable.rowHeight = UITableView.automaticDimension
        self.inProgressTable.estimatedRowHeight = 80
        self.inProgressTable.separatorStyle = .none
        self.completedTable.separatorStyle = .none
        
        ref = Database.database().reference()
        ref?.child("Event").observe(.childAdded, with: { (snapshot) in
            if let post = snapshot.value as? NSDictionary {
                
                if let id = post.object(forKey: "ID") as? NSNumber,
                    let sensor = post.object(forKey: "sensor") as? String,
                    let status = post.value(forKey: "status") as? String,
                    let timestamp = post.value(forKey: "timestamp") as? String {
                    
                    let warning = Warning(id: id, sensor: sensor, status: status, timestamp: timestamp)
                    
                    if self.isCompleted(inProgressWarnings: self.inProgressWarnings, newWarning: warning) {
                        self.completedWarnings.append(warning)
                    } else {
                        self.inProgressWarnings.append(warning)
                    }
                    
                    self.completedTable.reloadData()
                    self.inProgressTable.reloadData()
                }
            }
        })
        ref?.child("Event").observe(.childRemoved, with: { (snapshot) in
            self.inProgressWarnings = []
            self.inProgressWarnings.append(Warning(id: -1, sensor: "Oven", status: "is on", timestamp: "12:11"))
            self.completedWarnings = []
            self.inProgressTable.reloadData()
            self.completedTable.reloadData()
        })
        self.inProgressWarnings.append(Warning(id: -1, sensor: "Oven", status: "is on", timestamp: "12:11"))
    }
    
    let colours = [UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1),
                  UIColor(red: 219/255, green: 68/255, blue: 55/255, alpha: 1),
                  UIColor(red: 240/255, green: 160/255, blue: 0/255, alpha: 1),
                  UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1),] // blue, red, yellow, green
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numCells:Int = 0
        if tableView == self.inProgressTable {
            numCells = inProgressWarnings.count
        } else if tableView == self.completedTable {
            numCells = completedWarnings.count
        }
        return numCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = WarningTableViewCell()
        if tableView == self.inProgressTable {
            cell = tableView.dequeueReusableCell(withIdentifier: "inProgressCell", for: indexPath) as! WarningTableViewCell

            cell.warning.text = inProgressWarnings[indexPath.row].sensor + " " + inProgressWarnings[indexPath.row].status
            cell.time.text = inProgressWarnings[indexPath.row].timestamp
            cell.colour.backgroundColor = colours[indexPath.row % 4]
            cell.backgroundColor = UIColor(red: 197/255, green: 197/255, blue: 197/255, alpha: 0.2)
            
            return cell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "completedCell", for: indexPath) as! WarningTableViewCell
            
            cell.warning.text = completedWarnings[indexPath.row].sensor + " " + completedWarnings[indexPath.row].status
            cell.time.text = completedWarnings[indexPath.row].timestamp
            cell.colour.backgroundColor = colours[indexPath.row % 4]
            cell.backgroundColor = UIColor(red: 197/255, green: 197/255, blue: 197/255, alpha: 0.2)
            cell.contentView.alpha = 0.4
        }
        return cell
    }
    
    func isCompleted(inProgressWarnings: [Warning], newWarning: Warning) -> Bool {
        let modifiedInProgressWarnings = self.inProgressWarnings.filter {$0.id != newWarning.id}
        if self.inProgressWarnings != modifiedInProgressWarnings {
            self.inProgressWarnings = modifiedInProgressWarnings
            return true
        }
        return false
    }
}

class Warning: Equatable {
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
    
    static func == (lhs: Warning, rhs: Warning) -> Bool {
        return lhs.id == rhs.id
    }
}
