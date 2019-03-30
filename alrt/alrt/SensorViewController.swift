//
//  SensorViewController.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-03-30.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import UIKit

class SensorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sensorsTable: UITableView!
    
    let cellSpacingHeight:CGFloat = 10
    
    var sensors:[Sensor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sensorsTable.separatorStyle = UITableViewCell.SeparatorStyle.none;
        sensors.append(Sensor(image: UIImage(named: "door")!, name: "Front Door"))
        sensors.append(Sensor(image: UIImage(named: "oven")!, name: "Oven Door"))
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sensors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sensorCell") as! SensorTableViewCell
        cell.sensorImage.image = sensors[indexPath.section].image
        cell.sensorName.text = sensors[indexPath.section].name
        
        return cell
    }
    
    @IBAction func addSensor(_ sender: Any) {
        //TO-DO
    }
    
}

class Sensor {
    
    let image:UIImage
    let name:String
    
    init(image: UIImage, name: String) {
        self.image = image
        self.name = name
    }
}
