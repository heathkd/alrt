//
//  MedicineTableViewCell.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-03-18.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import UIKit

class MedicineTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
