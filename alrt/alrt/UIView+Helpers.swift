//
//  UIView+Helpers.swift
//  
//
//  Created by Heather D'Souza on 2019-04-01.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.shadowOffset = CGSize.init(width: 0.0, height: 0.0)
    }
}
