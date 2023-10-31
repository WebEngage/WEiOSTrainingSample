//
//  CartItemCell.swift
//  SampleTraningApp
//
//  Created by Bhavesh Sarwar on 01/11/23.
//

import UIKit

class CartItemCell : UITableViewCell{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageViewX!
    
    
    func configure(data:Product){
        self.productImageView.image = UIImage(named: data.image)
        self.titleLabel.text = data.title
        self.priceLabel.text = "Price : \(data.price)"
    }
    @IBAction func removeCartAction(_ sender: Any) {
        
        if let vc = self.viewController() as? CartVC{
            vc.cartItems.removeAll(where: {$0.title == titleLabel.text!})
            vc.showToast(message: "Removed Product From Cart")
            vc.tableView.reloadData()
        }
    }
}

