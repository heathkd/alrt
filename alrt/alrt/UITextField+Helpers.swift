//
//  UITextField+Helpers.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-03-30.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func underline() {
        let border = CALayer()
        let lineWidth = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        let textField: UITextField = self
        border.frame = CGRect(x: 0, y: textField.frame.size.height - lineWidth, width: textField.frame.size.width + 10, height: textField.frame.size.height - lineWidth)
        border.borderWidth = lineWidth
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
}
