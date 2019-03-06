//
//  WarningTableViewCell.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-03-02.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import UIKit

class WarningTableViewCell: UITableViewCell {

    @IBOutlet weak var warning: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
