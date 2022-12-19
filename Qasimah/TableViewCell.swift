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

class favORusedCell: UITableViewCell{
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var shopButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 8
        self.copyButton.layer.cornerRadius = self.copyButton.frame.height / 2
        self.copyButton.layer.borderColor = UIColor(red: 255/255, green: 211/255, blue: 106/255, alpha: 1).cgColor
        self.copyButton.layer.borderWidth = 1
        //self.copyButton.backgroundColor = UIColor.white
        self.productImage.layer.cornerRadius = self.productImage.frame.height / 2
    }
}

class notiCell: UITableViewCell {

    
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 8
        
    }
}
