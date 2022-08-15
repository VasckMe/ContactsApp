//
//  UIViewControllerExtension.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 13.08.22.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
