//
//  UIViewController+Alerts.swift
//  ContactDayDemo
//
//  Created by HEESU SHIN on 2017. 3. 8..
//  Copyright © 2017년 HEESU SHIN-ING. All rights reserved.
//

import UIKit

extension UIViewController {
    /**
     * Shows a default alert/info message with an OK button.
     */
    func showAlertMessage(_ message: String, okButtonTitle: String = "Ok") -> Void {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}



