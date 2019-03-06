//
//  ViewController.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-02-27.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(nextPage), userInfo: nil, repeats: false)
    }
   
    
    @objc func nextPage() {
        performSegue(withIdentifier: "homepageToTable", sender: self)
    }
    
    
    
    
}

