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

extension UIViewController {
    func showToast(message: String, duration: TimeInterval = 2.0) {
        let toastLabel = UILabel()
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.text = message
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 15.0)
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor(white: 0, alpha: 0.7)
        toastLabel.alpha = 0.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true

        view.addSubview(toastLabel)

        NSLayoutConstraint.activate([
            toastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            toastLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            toastLabel.heightAnchor.constraint(equalToConstant: 40)
        ])

        UIView.animate(withDuration: 0.5, animations: {
            toastLabel.alpha = 1.0
        }) { (completed) in
            UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: { (completed) in
                toastLabel.removeFromSuperview()
            })
        }
    }
}
