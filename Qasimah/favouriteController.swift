//
//  favouriteController.swift
//  Qasimah
//
//  Created by Jimmy on 12/10/2022.
//

import UIKit

class favouriteController: UIViewController,UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var favTable: UITableView!
    @IBOutlet weak var backButton: UIButton!
    var sectionNum:Int = 6
    override func viewDidLoad() {
        super.viewDidLoad()

        favTable.delegate = self
        favTable.dataSource = self
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
        let cell = favTable.dequeueReusableCell(withIdentifier: "favORusedCell", for: indexPath) as! favORusedCell
        cell.copyButton.addTarget(self, action: #selector(copyFav), for: .touchUpInside)
        cell.cancelButton.addTarget(self, action: #selector(cancelFav), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 195
    }
    
    @objc func copyFav(_ sender: UIButton){
        sender.setTitleColor(UIColor(red: 255/255, green: 211/255, blue: 106/255, alpha: 1), for: .normal)
        sender.backgroundColor = UIColor.black
        sender.setTitle("تم النسخ", for: .normal)
    }
    
    @objc func cancelFav(_ sender: UIButton){
        sectionNum = sectionNum - 1
        let cell:UITableViewCell = sender.superview?.superview as! UITableViewCell
        
        let indexPath = favTable.indexPath(for: cell)
        favTable.deleteSections(IndexSet(integer: indexPath!.section), with: .automatic)
    }
}
