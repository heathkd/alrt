//
//  ProfileViewController.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-03-18.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var medicine: UITextField!
    @IBOutlet weak var specialNotes: UITextView!
    @IBOutlet weak var medicinesTable: UITableView!
    
    var medicines:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        self.name.underline()
        self.medicine.underline()
        self.age.underline()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if let medicine = medicine.text, medicine.count > 0 {
            medicines.append(medicine)
            self.medicinesTable.reloadData()
            self.medicine.text = ""
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicineCell", for: indexPath) as! MedicineTableViewCell
        cell.name.text = medicines[indexPath.row]
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
