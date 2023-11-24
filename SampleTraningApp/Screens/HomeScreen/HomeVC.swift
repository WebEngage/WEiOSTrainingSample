//
//  HomeVC.swift
//  SampleTraningApp
//
//  Created by Bhavesh Sarwar on 31/10/23.
//

import UIKit
import WebEngage
import WEPersonalization

class HomeVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var categories: [Category] = [
        Category(
            title: "Electronics",
            products: [
                Product(image: "smartphone", title: "Smartphone X", price: "799.99₹"),
                Product(image: "laptop", title: "Laptop Pro", price: "1299.99₹"),
                Product(image: "headphone", title: "Wireless Headphones", price: "149.99₹"),
                Product(image: "tv", title: "4K Smart TV", price: "599.99₹")
            ]
        ),
        Category(
            title: "Clothing",
            products: [
                Product(image: "denim", title: "Men's Denim Jeans", price: "49.99₹"),
                Product(image: "casual", title: "Women's Casual Dress", price: "39.99₹"),
                Product(image: "hoodie", title: "Kids' Hoodie", price: "29.99₹"),
                Product(image: "shoes", title: "Sports Shoes", price: "69.99₹")
            ]
        ),
        Category(
            title: "Home and Garden",
            products: [
                Product(image: "sofaset", title: "Sofa Set", price: "799.99₹"),
                Product(image: "kitchen", title: "Kitchen Appliances", price: "299.99₹"),
                Product(image: "garden", title: "Garden Tools", price: "59.99₹"),
                Product(image: "bedding", title: "Bedding Set", price: "99.99₹")
            ]
        )
    ]
    var selectedProduct:Product? = nil
    
    @IBOutlet weak var categoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        WebEngage.sharedInstance().user.login("sn_abc")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        WebEngage.sharedInstance().analytics.navigatingToScreen(withName: "Home")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableCell
        let cellData = categories[indexPath.row]
        cell.configure(data: cellData)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProductDetailsVC{
            vc.product = selectedProduct
        }
    }
}

