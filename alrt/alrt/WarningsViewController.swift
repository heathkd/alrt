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
                
                if let sensor = post.object(forKey: "sensor") as? NSNumber,
                    let open = post.object(forKey: "open") as? NSNumber,
                    let time = post.value(forKey: "time") as? NSNumber {
                    
                    let warning = Warning(sensor: sensor, open: open, time: time)
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

        cell.warning.text = warnings[indexPath.row].sensor.stringValue
        cell.time.text = warnings[indexPath.row].time.stringValue
        cell.colour.backgroundColor = colours[indexPath.row % 4]
        cell.backgroundColor = UIColor(red: 197/255, green: 197/255, blue: 197/255, alpha: 0.2)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(65)
//    }
}

class Warning {
    
    let sensor: NSNumber
    let open: NSNumber
    let time: NSNumber
    
    init (sensor: NSNumber, open: NSNumber, time: NSNumber) {
        self.sensor = sensor
        self.open = open
        self.time = time
    }
}
