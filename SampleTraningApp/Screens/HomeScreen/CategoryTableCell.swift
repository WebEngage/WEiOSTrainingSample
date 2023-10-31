//
//  CategoryTableCell.swift
//  SampleTraningApp
//
//  Created by Bhavesh Sarwar on 01/11/23.
//

import Foundation
import UIKit

class CategoryTableCell:UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productsCollectionVIew: UICollectionView!
    
    var products:[Product] = []
    
    func configure(data:Category){
        titleLabel.text = data.title
        products = data.products
        productsCollectionVIew.dataSource = self
        productsCollectionVIew.delegate = self
        productsCollectionVIew.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 175)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
        cell.configure(data: products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = collectionView.viewController() as? HomeVC{
            vc.selectedProduct = products[indexPath.row]
            vc.performSegue(withIdentifier: "showProductDetails", sender: self)
        }
    }
}
