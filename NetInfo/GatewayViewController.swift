//
//  GatewayViewController.swift
//  NetInfo
//
//  Created by Chuck.Zhou on 10/14/20.
//

import UIKit

class GatewayViewController: UIViewController {
    
    var pageTitle = ""
    var gatewayIPAddress = ""
//    let netService = NetworkUtility()
    
    @IBOutlet var gwIPAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = pageTitle
//        gatewayIPAddress =
//        DispatchQueue.main.async {
//            let aa = self.netService.getGatewayInfo()
//            print(aa)
//        }
        let aa = NetworkUtility.shared.getGatewayInfo()
//                self.netService.getGatewayInfo()
        print(aa)
        gwIPAddress.text = aa
//            print(netService.getGatewayInfo())
//        print("OOOO : \(gatewayIPAddress)")
//        gwIPAddress.text = netService.getGatewayInfo()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
