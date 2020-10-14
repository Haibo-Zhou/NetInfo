//
//  NetworkUtility.swift
//  NetInfo
//
//  Created by Chuck.Zhou on 10/14/20.
//

import UIKit
import Network

class NetworkUtility {
    var gatewayIPAddress: String?
    static let shared = NetworkUtility()
    
    func getGatewayInfo() -> String {
        let monitor = NWPathMonitor(requiredInterfaceType: .wifi)
        monitor.pathUpdateHandler = { path in
            if !path.gateways.isEmpty {
                let endpoint = path.gateways[0]
                switch endpoint {
                case .hostPort(let host, _):
                    self.gatewayIPAddress = host.debugDescription
                    print("Gateway: \(self.gatewayIPAddress!)")
                default:
                    break
                }
            } else {
                print("Wifi connection may be dropped.")
            }
        }
        monitor.start(queue: DispatchQueue(label: "nwpathmonitor.queue"))

        return gatewayIPAddress ?? "N/A"
    }
}
