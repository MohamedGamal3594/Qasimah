//
//  BestOffersController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 02/09/2022.
//

import UIKit

class BestOffersController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var bestCollection: UICollectionView!
    @IBOutlet weak var bestTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bestCollection.delegate = self
        bestCollection.dataSource = self
        bestTableView.delegate = self
        bestTableView.dataSource = self
        
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setUpView(backButton)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bestCollection.dequeueReusableCell(withReuseIdentifier: "bestCell", for: indexPath)
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bestCollection.frame.width * 0.75, height: bestCollection.frame.height)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
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
        let cell = bestTableView.dequeueReusableCell(withIdentifier: "bestTableCell", for: indexPath) as! bestTableCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 107
    }
    

    
}
