//
//  TimerViewController.swift
//  Record
//
//  Created by 松浦和哉 on 2021/01/13.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet var label: UILabel!
    
    @IBOutlet var durationLabel: UILabel!
    
    var count : TimeInterval = 0.0
    
    var timer: Timer = Timer()
    
    var log: [String: Any] = [:]
    
    let saveData : UserDefaults = UserDefaults.standard
    
    var logList :  [[String: Any]] = []
    
    
    @objc func down(){
        count = count - 0.01
        label.text = String(format: "%.2f", count)
        
        for index in 0..<logList.count{
            let name: String = logList[index]["name"] as! String
            if name == log["name"] as! String{
                logList[index]["duration"] = count
            }
        }
        saveData.set(logList, forKey: "logs")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = log["duration"] as! TimeInterval
        print(count)
        
        logList = saveData.object(forKey: "logs") as! [[String: Any]]
        
       
        // Do any additional setup after loading the view.
        
        let startTimerInterval = log["startDate"] as! TimeInterval
        let startDate = Date(timeIntervalSince1970: startTimerInterval)
        
        let endTimerInterval = log["endDate"]  as! TimeInterval
        let endDate = Date(timeIntervalSince1970: endTimerInterval)
        
        let difference = startDate.distance(to: endDate)
        
        durationLabel.text = String(difference)
        label.text = String(count)
        
        
        
        
    }
    @IBAction func start(){
        if !timer.isValid{
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.down),userInfo: nil, repeats: true)

        }
    }
    @IBAction func stop(){
        if timer .isValid{
            timer.invalidate()
        
    }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        timer.isValid
         
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
