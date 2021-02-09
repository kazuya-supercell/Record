//
//  setViewController.swift
//  Record
//
//  Created by 松浦和哉 on 2021/01/17.
//

import UIKit

class setViewController: UIViewController {
    
    @IBOutlet var label : UILabel!
    @IBOutlet var eventNameTextField : UITextField!
    @IBOutlet   var datePickerView : UIDatePicker!
    
    let saveData: UserDefaults = .standard

    @IBAction func tapSaveButton (){
        let  name = eventNameTextField.text!
        let date = datePickerView.date
        //userDefaultに保存する
        let log : [String: Any] = [
            " name" : name,
            "startDate" : date.timeIntervalSince1970,
            
            "duration" : 0
        ]
        var currentLogs:[[String: Any]] = saveData.array(forKey: "logs") as! [[String: Any]]
        
        currentLogs.append(log)
        saveData.set(currentLogs, forKey: "logs")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
