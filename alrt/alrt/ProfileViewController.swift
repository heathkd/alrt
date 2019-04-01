//
//  ProfileViewController.swift
//  alrt
//
//  Created by Heather D'Souza on 2019-03-18.
//  Copyright © 2019 Heather D'Souza. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var medicine: UITextField!
    @IBOutlet weak var specialNotes: UITextView!
    @IBOutlet weak var medicinesTable: UITableView!
    
    
    var medicines:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.medicinesTable.separatorStyle = .none
        self.specialNotes.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        self.specialNotes.returnKeyType = .done
        self.medicinesTable.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        self.view.addGestureRecognizer(tap)
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
        cell.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
