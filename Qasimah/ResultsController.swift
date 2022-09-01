//
//  ResultsController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 31/08/2022.
//

import UIKit

class ResultsController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var catogreyNames:[String] = ["عطور","اكسسوارات","السفر","مطاعم","المنزل"]
    var orderNames:[String] = ["اعلي الخصومات","ا-ي","ي-ا"]
    @IBOutlet weak var orderCollection: UICollectionView!
    @IBOutlet weak var classCollection: UICollectionView!
    @IBOutlet weak var swipeShape: UIView!
    @IBOutlet weak var removeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeShape.layer.cornerRadius = swipeShape.frame.height / 2
        catogreyNames.reverse()
        orderNames.reverse()
        orderCollection.delegate = self
        classCollection.delegate = self
        orderCollection.dataSource = self
        classCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.classCollection{
            return catogreyNames.count
        }
        
            return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let classCell = classCollection.dequeueReusableCell(withReuseIdentifier: "classCell", for: indexPath) as! classCell
        classCell.cellButton.setTitle(catogreyNames[indexPath.row], for: .normal)
            classCell.cellButton.addTarget(self, action: #selector(classSelectedButton), for: .touchUpInside)
            
        if collectionView == orderCollection{
            let orderCell = orderCollection.dequeueReusableCell(withReuseIdentifier: "orderCell", for: indexPath) as! orderCell
            orderCell.cellButton.setTitle(orderNames[indexPath.row], for: .normal)
            orderCell.cellButton.addTarget(self, action: #selector(orderSelectedButton), for: .touchUpInside)
            return orderCell
        }
            return classCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.classCollection{
            let widthPercent = Double(catogreyNames[indexPath.row].count)*0.04
            return CGSize(width: classCollection.frame.width * widthPercent, height: classCollection.frame.height)
        }
        let widthPercent = Double(orderNames[indexPath.row].count)*0.04
        return CGSize(width: orderCollection.frame.width * widthPercent, height: orderCollection.frame.height)
    }
    
    @objc func orderSelectedButton(_ sender: UIButton){
        for i in 0 ... orderNames.count - 1 {
            let indexPath = IndexPath(item: i, section: 0)
            let orderCell = orderCollection.cellForItem(at: indexPath) as! orderCell
            
            orderCell.cellButton.setTitleColor(UIColor.black, for: .normal)
            
            orderCell.cellButton.tintColor = UIColor.white
        }
        sender.setTitleColor(UIColor.init(red: 255/255, green: 211/255, blue: 106/255, alpha: 1), for: .normal)
        sender.tintColor = UIColor.init(red: 47/255, green: 178/255, blue: 162/255, alpha: 1)
    }
    
    @objc func classSelectedButton(_ sender: UIButton){
        if sender.titleLabel?.textColor == UIColor.black{
            sender.setTitleColor(UIColor.init(red: 255/255, green: 211/255, blue: 106/255, alpha: 1), for: .normal)
            sender.tintColor = UIColor.init(red: 47/255, green: 178/255, blue: 162/255, alpha: 1)
        }
        else{
            sender.setTitleColor(UIColor.black, for: .normal)
            
            sender.tintColor = UIColor.white
        }
    }

}
