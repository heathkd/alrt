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
                    Warning(warning: "Tap is running", time: "17:14")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return warnings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WarningTableViewCell

        cell.warning.text = warnings[indexPath.row].warning
        cell.time.text = warnings[indexPath.row].time
        
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
