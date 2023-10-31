//
//  ProductCell.swift
//  SampleTraningApp
//
//  Created by Bhavesh Sarwar on 01/11/23.
//

import UIKit

class ProductCell:UICollectionViewCell{
    @IBOutlet weak var imageVIew: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(data:Product){
        titleLabel.text = data.title
        priceLabel.text = data.price
        let image = data.image
        self.imageVIew.image = UIImage(named: image)
    }
}
