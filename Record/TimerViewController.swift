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
    
    var count : Float = 0.0
    
    var timer: Timer = Timer()
    
    var log: [String: Any] = [:]
    
    
    @objc func up(){
        count = count - 0.01
        label.text = String(format: "%.2f", count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
        
        let startTimerInterval = log["startDate"] as! TimeInterval
        let startDate = Date(timeIntervalSince1970: startTimerInterval)
        
        let endTimerInterval = log["endDate"]  as! TimeInterval
        let endDate = Date(timeIntervalSince1970: endTimerInterval)
        
        let difference = endDate.distance(to: startDate)
        
        durationLabel.text = String(difference)
        
    }
    @IBAction func start(){
        if !timer.isValid{
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up),userInfo: nil, repeats: true)

        }
    }
    @IBAction func stop(){
        if timer .isValid{
            timer.invalidate()
        
    }
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
