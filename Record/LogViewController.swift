//
//  LogViewController.swift
//  Record
//
//  Created by 松浦和哉 on 2021/01/22.
//

import UIKit

class LogViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = logList[indexPath.row]["name"] as! String
        
        return cell!
    }
    
    
    @IBOutlet var tableView : UITableView!
    
    @IBOutlet var button : UIButton!
    
    var logList  : [[String:Any]] = []
    
    var saveData: UserDefaults = UserDefaults.standard
    
    let database = UserDefaults.standard // データベース
    
   
   
    @IBAction func tapCell(){
        
    


        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.delegate = self
        logList = saveData.object(forKey: "logs") as! [[String: Any]]

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            logList.remove(at: indexPath.row)
            database.set(logList, forKey: "logs")
            tableView.deleteRows(at: [indexPath], with: .fade)
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
