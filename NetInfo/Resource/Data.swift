//
//  Data.swift
//  NetInfo
//
//  Created by Chuck.Zhou on 10/14/20.
//

import UIKit

class Data {
    private var functions = [Function]()
    
    func loadData() -> [Function] {
        functions.append(Function(funcName: "Gateway Info", funcImage: UIImage(systemName: "network")!))
        functions.append(Function(funcName: "Port Scan", funcImage: UIImage(systemName: "scanner")!))
        functions.append(Function(funcName: "Ping", funcImage: UIImage(systemName: "paperclip.circle")!))
        functions.append(Function(funcName: "Trace Route", funcImage: UIImage(systemName: "paperplane")!))
        functions.append(Function(funcName: "DNS Lookup", funcImage: UIImage(systemName: "viewfinder")!))
        functions.append(Function(funcName: "Server Monitor", funcImage: UIImage(systemName: "lifepreserver")!))
        functions.append(Function(funcName: "LAN Scan", funcImage: UIImage(systemName: "waveform.circle")!))
        functions.append(Function(funcName: "My Server List", funcImage: UIImage(systemName: "list.star")!))
        functions.append(Function(funcName: "Recent Tasks", funcImage: UIImage(systemName: "list.bullet.rectangle")!))
        
        return functions
    }
}
