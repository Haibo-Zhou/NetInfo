//
//  ExtensionFIle.swift
//  NetInfo
//
//  Created by Chuck.Zhou on 10/15/20.
//

import UIKit

extension UIViewController {
    
    func showErrorMessage(errorTitle : String, errorMessage : String) {
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
