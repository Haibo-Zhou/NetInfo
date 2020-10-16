//
//  GatewayViewController.swift
//  NetInfo
//
//  Created by Chuck.Zhou on 10/14/20.
//

import UIKit

class GatewayViewController: UIViewController {
    @IBOutlet weak var gatewayLabel: UILabel!
    @IBOutlet weak var gwIPLabel: UILabel!
    @IBOutlet var gwIPAddress: UILabel!
    
    var pageTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = pageTitle
        view.backgroundColor = .systemGray5
        
        // Receive remoteHost from callback parameter(aka. gateway ip address)
        NetworkUtility().getGatewayInfo { (remoteHost) in
            print("remoteHost: \(remoteHost)")
            DispatchQueue.main.async {
                self.gwIPAddress.text = remoteHost
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gwIPAddress.text = "N/A"
    }

}
