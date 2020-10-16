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
    
    var pageTitle = ""
//    var gatewayIPAddress = "N/A"
//    let netService = NetworkUtility()
    
    @IBOutlet var gwIPAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = pageTitle
        
        gatewayLabel.adjustsFontSizeToFitWidth = true
        gatewayLabel.sizeToFit()
        
        gwIPLabel.adjustsFontSizeToFitWidth = true
        gwIPLabel.sizeToFit()
        
        // Receive remoteHost from callback parameter(aka. gateway ip address)
        NetworkUtility().getGatewayInfo { (remoteHost) in
            print("remote: \(remoteHost)")
            DispatchQueue.main.async {
                self.gwIPAddress.text = remoteHost
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gwIPAddress.text = "N/A"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
