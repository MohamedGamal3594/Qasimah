//
//  NotificationController.swift
//  Qasimah
//
//  Created by Jimmy on 20/10/2022.
//

import UIKit

class NotificationController: UIViewController,UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var notiTable: UITableView!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notiTable.delegate = self
        notiTable.dataSource = self
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setUpView(backButton)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 40
        }
        else{
            return 3
        }
        
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notiTable.dequeueReusableCell(withIdentifier: "notiCell", for: indexPath) as! notiCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
    }
    


}
