//
//  ProductDetailsVC.swift
//  SampleTraningApp
//
//  Created by Bhavesh Sarwar on 31/10/23.
//

import UIKit

class ProductDetailsVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageVIew: UIImageView!
    var product:Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.titleLabel.text = "Product Name : \(self.product!.title)"
        self.priceLabel.text = "Price : \(self.product!.price)"
        if let image = UIImage(named: self.product?.image ?? ""){
            self.imageVIew.image = image
        }
    }
    @IBAction func addCartAction(_ sender: Any) {
        if let tabVC = self.navigationController?.viewControllers.first(where: {$0 is UITabBarController}) as? UITabBarController{
            if let cartVc = tabVC.viewControllers?.first(where: {$0 is CartVC}) as? CartVC{
                if !cartVc.cartItems.contains(where: {$0.title == product!.title}){
                    self.showToast(message: "Item Added to cart")
                    cartVc.cartItems.append(product!)
                }
            }
        }
    }
}
