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
    
    // MARK: - Gateway Info
    func getGatewayInfo(completionHandler: @escaping (String) -> ()) {
        let monitor = NWPathMonitor(requiredInterfaceType: .wifi)
        monitor.pathUpdateHandler = { path in
            if let endpoint = path.gateways.first {
                switch endpoint {
                case .hostPort(let host, _):
                    let remoteHost = host.debugDescription
                    print("Gateway: \(remoteHost)")
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
    
    // MARK: - Port Scaner
    // Get number of threads for scan ports
    func getSegmentsQueues(min: Int, max: Int, maxPerSegment: Int) -> [[Int]] {
        
        var start: Int = min
        var portSegments = [[Int]]()
        
        while start <= max {
            var _portSegment = [Int]()
            
            for _ in 1...maxPerSegment {
                
                if start <= max {
                    _portSegment.append(start)
                }
                
                start += 1
            }
            
            portSegments.append(_portSegment)
        }
        
        return portSegments
    }


    // Crate queques for scan ports by segments
    func QueueDispatchPort(address: String, minPort: Int, maxPort: Int, segmentsQueues: (Int, Int, Int) -> [[Int]]) -> [Int] {
        var openPorts : [Int] = []
        let segmentPorts = segmentsQueues(minPort, maxPort, 1);
        
        let group = DispatchGroup()
        
        for segment in segmentPorts {
            group.enter()
            DispatchQueue.global().async {
                for port in segment {
                    let client = TCPClient(address: address, port: Int32(port))
                    switch client.connect(timeout: 2) {
                        case .success:
                            openPorts.append(port)
                        case .failure(_):
                            print("port \(port) closed")
                    }
                    client.close()
                }
                group.leave()
            }
        }
        
        group.wait()

        return openPorts
    }
    
    // Scans ports from an address and a range given by the user
    func scanPorts(address : String, start : Int, stop : Int) -> [Int] {
        let openPorts = QueueDispatchPort(
            address: address, minPort: start, maxPort: stop, segmentsQueues:
            getSegmentsQueues(min:max:maxPerSegment:))
        
        return openPorts
    }
    
    
    
    

}
