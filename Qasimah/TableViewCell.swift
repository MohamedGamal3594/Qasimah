//
//  TableViewCell.swift
//  Qasimah
//
//  Created by Eslamcr79 on 04/08/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var codeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 8
        self.cellImage.layer.cornerRadius = self.cellImage.frame.height / 2
        
    }
}

class bestTableCell: UITableViewCell{
    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
        
        productImage.layer.cornerRadius = productImage.frame.height / 2
        productImage.layer.borderColor = UIColor.darkGray.cgColor
        productImage.layer.borderWidth = 1
    }
    
}
