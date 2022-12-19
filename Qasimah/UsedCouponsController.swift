//
//  UsedCouponsController.swift
//  Qasimah
//
//  Created by Jimmy on 19/10/2022.
//

import UIKit

class UsedCouponsController: UIViewController,UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource {



    @IBOutlet weak var usedTable: UITableView!
    @IBOutlet weak var backButton: UIButton!
    var sectionNum:Int = 6
    override func viewDidLoad() {
        super.viewDidLoad()
        usedTable.delegate = self
        usedTable.dataSource = self
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setUpView(backButton)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNum
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 3
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usedTable.dequeueReusableCell(withIdentifier: "favORusedCell", for: indexPath) as! favORusedCell
        cell.copyButton.addTarget(self, action: #selector(copyUsed), for: .touchUpInside)
        cell.cancelButton.addTarget(self, action: #selector(cancelUsed), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 195
    }
    
    @objc func copyUsed(_ sender: UIButton){
        sender.setTitleColor(UIColor(red: 255/255, green: 211/255, blue: 106/255, alpha: 1), for: .normal)
        sender.backgroundColor = UIColor.black
        sender.setTitle("تم النسخ", for: .normal)
    }
    
    @objc func cancelUsed(_ sender: UIButton){
        sectionNum = sectionNum - 1
        let cell:UITableViewCell = sender.superview?.superview as! UITableViewCell
        
        let indexPath = usedTable.indexPath(for: cell)
        usedTable.deleteSections(IndexSet(integer: indexPath!.section), with: .automatic)
    }


}
