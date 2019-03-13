//
//  WarningsViewController.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-03-02.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import UIKit

class WarningsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var warningsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let warnings = [Warning(warning: "Door is open", time: "13:20"),
                    Warning(warning: "Stove is on", time: "14:45"),
                    Warning(warning: "Tap is running", time: "17:14"),
                    Warning(warning: "Shower is running", time: "17:20"),
                    Warning(warning: "Door is closed", time: "18:50")]
    
    let colours = [UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1),
                  UIColor(red: 219/255, green: 68/255, blue: 55/255, alpha: 1),
                  UIColor(red: 240/255, green: 160/255, blue: 0/255, alpha: 1),
                  UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1),] // blue, red, yellow, green
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return warnings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WarningTableViewCell

        cell.warning.text = warnings[indexPath.row].warning
        cell.time.text = warnings[indexPath.row].time
        cell.colour.backgroundColor = colours[indexPath.row % 4]
        cell.backgroundColor = UIColor(red: 197/255, green: 197/255, blue: 197/255, alpha: 0.2)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(65)
//    }
}

struct Warning {
    let warning: String
    let time: String
}
