//
//  setViewController.swift
//  Record
//
//  Created by 松浦和哉 on 2021/01/17.
//

import UIKit

class setViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var label : UILabel!
    @IBOutlet var eventNameTextField : UITextField!
    @IBOutlet var startdatePickerView : UIDatePicker!
    @IBOutlet var enddatePickerView : UIDatePicker!
    
    let saveData: UserDefaults = .standard

    @IBAction func tapSaveButton (){
        let  name = eventNameTextField.text!
        let startDate = startdatePickerView.date
        let endDate = enddatePickerView.date
        //userDefaultに保存する
        let log : [String: Any] = [
            "name" : name,
            "startDate" : startDate.timeIntervalSince1970,
            "endDate" : endDate.timeIntervalSince1970,
            "duration" : startDate.distance(to: endDate)
        ]
        var currentLogs:[[String: Any]] = saveData.array(forKey: "logs") as? [[String: Any]] ?? []
        
        currentLogs.append(log)
        saveData.set(currentLogs, forKey: "logs")

        self.dismiss(animated: true, completion: nil)
    
        
        
    }
    
    @IBAction func tapBackButton(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbar = UIToolbar()
        
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let okbutton: UIBarButtonItem = UIBarButtonItem(title: "閉じる", style: UIBarButtonItem.Style.plain, target: self, action: #selector(tapOkButton))
        
        toolbar.setItems([flexibleItem, okbutton, flexibleItem], animated: true)
        toolbar.sizeToFit()
        eventNameTextField.delegate = self
        
        self.view.endEditing(true)
        eventNameTextField .inputAccessoryView = toolbar

        // Do any additional setup after loading the view.
    }
    
    @objc func tapOkButton(_ sender: UIButton) {
        self.view.endEditing(true)
        let inputPassword = eventNameTextField.text!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
