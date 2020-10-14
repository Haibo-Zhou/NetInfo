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
        functions.append(Function(funcName: "Gateway Info", funcImage: UIImage(systemName: "gear")!))
        functions.append(Function(funcName: "Port Scan", funcImage: UIImage(systemName: "gear")!))
        functions.append(Function(funcName: "Ping", funcImage: UIImage(systemName: "gear")!))
        
        return functions
    }
}
