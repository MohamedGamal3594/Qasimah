//
//  HomeController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 08/07/2022.
//

import UIKit

class HomeController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var couponsTable: UITableView!
    @IBOutlet weak var catogreyCollection: UICollectionView!
    @IBOutlet weak var searchText: UITextField!
    let searchButton = UIButton(type: .system)
    let catogreyNames:[String] = ["الكل","عطور","اكسسوارات","السفر","مطاعم"]
    var selectedIndex: NSInteger = -1
    var favourites = [NSInteger]()
    var copiedCodes = [NSInteger]()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchText.layer.borderWidth = 1
        searchText.layer.borderColor = UIColor.black.cgColor
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = UIColor.black
        searchText.rightView = searchButton
        searchText.rightViewMode = .always
        searchText.attributedPlaceholder = NSAttributedString(string: "ابحث هنا", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        catogreyCollection.delegate = self
        catogreyCollection.dataSource = self
        couponsTable.delegate = self
        couponsTable.dataSource = self
        catogreyCollection.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catogreyNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.cellbutton.setTitle(catogreyNames[indexPath.row], for: .normal)
        cell.cellbutton.addTarget(self, action: #selector(selectedButton), for: .touchUpInside)
        cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
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
        headerView.backgroundColor = UIColor(red: 223/255, green: 225/255, blue: 225/255, alpha: 1)
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
        for i in 0 ... catogreyNames.count - 1 {
            let indexPath = IndexPath(item: i, section: 0)
            let cell = catogreyCollection.cellForItem(at: indexPath) as! CollectionViewCell
            
            cell.cellbutton.setTitleColor(UIColor.black, for: .normal)
            
            cell.cellbutton.tintColor = UIColor.init(red: 223/255, green: 225/255, blue: 225/255, alpha: 1)
        }
        sender.setTitleColor(UIColor.init(red: 255/255, green: 211/255, blue: 106/255, alpha: 1), for: .normal)
        sender.tintColor = UIColor.init(red: 47/255, green: 178/255, blue: 162/255, alpha: 1)
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

}
