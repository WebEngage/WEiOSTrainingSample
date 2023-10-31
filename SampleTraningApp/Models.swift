//
//  Models.swift
//  SampleTraningApp
//
//  Created by Bhavesh Sarwar on 01/11/23.
//

import UIKit


struct Product: Decodable {
    let image: String
    let title: String
    let price: String
}

struct Category: Decodable {
    let title: String
    let products: [Product]
}


extension UIView {
    func viewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let currentResponder = responder {
            if let viewController = currentResponder as? UIViewController {
                return viewController
            }
            responder = currentResponder.next
        }
        return nil
    }
}
