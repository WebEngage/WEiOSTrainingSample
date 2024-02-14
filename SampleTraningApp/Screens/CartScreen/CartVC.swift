//
//  CartVC.swift
//  SampleTraningApp
//
//  Created by Bhavesh Sarwar on 31/10/23.
//

import UIKit

class CartVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var buyNowButtonStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    var cartItems:[Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        buyNowButtonStackView.isHidden = (cartItems.count == 0) ? true : false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath) as! CartItemCell
        cell.configure(data: cartItems[indexPath.row])
        return cell
    }
}

