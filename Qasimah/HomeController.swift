//
//  HomeController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 08/07/2022.
//

import UIKit
import SideMenuSwift

class HomeController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var couponsTable: UITableView!
    @IBOutlet weak var catogreyCollection: UICollectionView!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var sideMenuButton: UIButton!
    @IBOutlet weak var downViewButton: UIButton!
    let searchButton = UIButton(type: .system)
    var catogreyNames:[String] = ["الكل","عطور","اكسسوارات","السفر","مطاعم"]
    var selectedIndex: NSInteger = -1
    var collectionCellIndex = -1
    var favourites = [NSInteger]()
    var copiedCodes = [NSInteger]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchText.layer.borderWidth = 1
        searchText.layer.borderColor = UIColor.black.cgColor
        searchText.layer.cornerRadius = 2
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = UIColor.black
        searchText.rightView = searchButton
        searchText.rightViewMode = .always
        searchText.attributedPlaceholder = NSAttributedString(string: "ابحث هنا", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        catogreyNames.reverse()
        catogreyCollection.delegate = self
        catogreyCollection.dataSource = self
        couponsTable.delegate = self
        couponsTable.dataSource = self
        
        sideMenuButton.addTarget(self, action: #selector(openSideMenu), for: .touchUpInside)
        downViewButton.addTarget(self, action: #selector(openDownView), for: .touchUpInside)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catogreyNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.cellbutton.tag = indexPath.item
        cell.cellbutton.setTitle(catogreyNames[indexPath.row], for: .normal)
        cell.cellbutton.addTarget(self, action: #selector(selectedButton), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPercent = Double(catogreyNames[indexPath.row].count)*0.04
        return CGSize(width: catogreyCollection.frame.width * widthPercent, height: catogreyCollection.frame.height)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.arrowButton.tag = indexPath.section
        cell.loveButton.tag = indexPath.section
        cell.codeButton.tag = indexPath.section
        cell.arrowButton.addTarget(self, action: #selector(arrowClicked), for: .touchUpInside)
        cell.loveButton.addTarget(self, action: #selector(likeClicked), for: .touchUpInside)
        cell.codeButton.addTarget(self, action: #selector(copyCode), for: .touchUpInside)
        
        if copiedCodes.contains(indexPath.section){
            cell.codeButton.viewWithTag(-1)?.removeFromSuperview()
            cell.codeButton.contentHorizontalAlignment = .center
        }
        else{
            if cell.codeButton.viewWithTag(-1) == nil{
                let copyCodeLbl = UILabel(frame: CGRect(x:26 , y: 0, width: 84, height: 35))
                copyCodeLbl.tag = -1
                copyCodeLbl.isUserInteractionEnabled = false
                copyCodeLbl.backgroundColor = UIColor.init(red: 47/255, green: 178/255, blue: 162/255, alpha: 1)
                copyCodeLbl.text = "انسخ الكود"
                copyCodeLbl.textAlignment = .center
                copyCodeLbl.textColor = UIColor.init(red: 255/255, green: 211/255, blue: 106/255, alpha: 1)
                copyCodeLbl.layer.masksToBounds = true
                copyCodeLbl.layer.cornerRadius = 17.5
                copyCodeLbl.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
                cell.codeButton.addSubview(copyCodeLbl)
            }
        }
        
        if favourites.contains(indexPath.section){
            cell.loveButton.setImage(UIImage(named: "like filled"), for: .normal)
        }
        else{
            cell.loveButton.setImage(UIImage(named: "like"), for: .normal)
        }
        if indexPath.section == selectedIndex{
            cell.arrowButton.setImage(UIImage(named: "down_up"), for: .normal)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == selectedIndex{
            return 224
        }
        else{
            if selectedIndex != -1{
                let cell = couponsTable.cellForRow(at: indexPath) as? TableViewCell
                cell?.arrowButton.setImage(UIImage(named: "down_arrow"), for: .normal)
            }
            return 85
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @objc func selectedButton(_ sender: UIButton){
        sender.setTitleColor(UIColor.init(red: 255/255, green: 211/255, blue: 106/255, alpha: 1), for: .normal)
        sender.tintColor = UIColor.init(red: 47/255, green: 178/255, blue: 162/255, alpha: 1)
        
        if collectionCellIndex != -1{
            let indexPath = IndexPath(item: collectionCellIndex, section: 0)
            let cell = catogreyCollection.cellForItem(at: indexPath) as! CollectionViewCell
            cell.cellbutton.setTitleColor(UIColor.black, for: .normal)
            cell.cellbutton.tintColor = UIColor.init(red: 237/255, green: 238/255, blue: 243/255, alpha: 1)
        }
        collectionCellIndex = sender.tag
    }
    
    @objc func arrowClicked(_ sender: UIButton){
        if sender.tag == selectedIndex{
            selectedIndex = -1
        }
        else{
            selectedIndex = sender.tag
        }
        let indexPath: IndexPath = IndexPath(item: 0, section: sender.tag)
        couponsTable.reloadRows(at: [indexPath], with: .automatic)
    }
    
    @objc func likeClicked(_ sender: UIButton){
        if sender.currentImage == UIImage(named: "like"){
            sender.setImage(UIImage(named: "like filled"), for: .normal)
            
            favourites.append(sender.tag)
        }
        else{
            sender.setImage(UIImage(named: "like"), for: .normal)
            if let index = favourites.firstIndex(of: sender.tag){
                favourites.remove(at: index)
            }
        }
    }
    
    @objc func copyCode(_ sender: UIButton){
        if !copiedCodes.contains(sender.tag){
            sender.viewWithTag(-1)?.removeFromSuperview()
            sender.contentHorizontalAlignment = .center
            copiedCodes.append(sender.tag)
        }
    }
    
    @objc func openSideMenu(_ sender: UIButton){
        sideMenuController?.revealMenu()
    }
    
    @objc func openDownView(_ sender: UIButton){
        let downView = storyboard?.instantiateViewController(withIdentifier: "resultsView") as! ResultsController
        if let sheet = downView.sheetPresentationController{
            sheet.detents = [.medium()]
        }
        present(downView, animated: true, completion: nil)
    }

}

extension UIViewController{
    @objc func backToHome(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUpView(_ sender:UIButton){
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.sideGesture(gesture:)))
        swipe.direction = .left
        self.view.addGestureRecognizer(swipe)
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        sender.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
    }
    
    @objc func sideGesture(gesture: UISwipeGestureRecognizer){
        if gesture.direction == .left{
            sideMenuController?.revealMenu()
        }
    }
}
