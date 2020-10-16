//
//  NetworkUtility.swift
//  NetInfo
//
//  Created by Chuck.Zhou on 10/14/20.
//

import UIKit
import Network
import SwiftSocket

class NetworkUtility {
    var openPorts = [Int]()
    
    // MARK: - Gateway Info
    func getGatewayInfo(completionHandler: @escaping (String) -> ()) {
        let monitor = NWPathMonitor(requiredInterfaceType: .wifi)
        monitor.pathUpdateHandler = { path in
            if let endpoint = path.gateways.first {
                switch endpoint {
                case .hostPort(let host, _):
                    let remoteHost = host.debugDescription
//                    print("Gateway: \(remoteHost)")
                    // Use callback here to return the ip address to the caller
                    completionHandler(remoteHost)
                default:
                    break
                }
            } else {
                print("Wifi connection may be dropped.")
            }
        }
        monitor.start(queue: DispatchQueue(label: "nwpathmonitor.queue"))
    }
    
    // Scans ports from an address and a range given by the user
    func scanPorts(address : String, start : Int, stop : Int, completion: @escaping ([Int]) -> ()) {
        
        DispatchQueue.global(qos: .default).async {
            for port in start...stop {
                let client = TCPClient(address: address, port: Int32(port))
                switch client.connect(timeout: 2) {
                    case .success:
                        self.openPorts.append(port)
//                        print("HH: port: \(self.openPorts)")
                    case .failure(_):
                        print("port \(port) closed")
                }
                client.close()
            }
            completion(self.openPorts)
        }
    }
}
