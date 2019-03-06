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
    
    let warnings = ["Door is open", "Stove is on", "Tap is running"];
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return warnings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WarningTableViewCell
        cell.warning.text = warnings[indexPath.row]
        
        return cell
    }
    
    
    
    
    
    
    
}
