//
//  SensorTableViewCell.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-03-30.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import UIKit

class SensorTableViewCell: UITableViewCell {

    @IBOutlet weak var sensorImage: UIImageView!
    @IBOutlet weak var sensorName: UILabel!
    @IBOutlet weak var shadowLayer: UIView!
    @IBOutlet weak var sensorNameView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
