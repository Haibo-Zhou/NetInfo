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


extension UIColor {
    static let lightGreen = UIColor(named: "lightGreen")
    static let textColor = UIColor(named: "textColor")
//    static let lightBlue = Color("lightBlue")
}

func validateIpAddress(ipToValidate: String) -> Bool {
    
    var sin = sockaddr_in()
    var sin6 = sockaddr_in6()

    if ipToValidate.withCString({ cstring in inet_pton(AF_INET6, cstring, &sin6.sin6_addr) }) == 1 {
        // IPv6 peer.
        return true
    }
    else if ipToValidate.withCString({ cstring in inet_pton(AF_INET, cstring, &sin.sin_addr) }) == 1 {
        // IPv4 peer.
        return true
    }

    return false;
}
