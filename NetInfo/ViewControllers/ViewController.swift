//
//  ViewController.swift
//  NetInfo
//
//  Created by Chuck.Zhou on 10/14/20.
//

import UIKit

class ViewController: UITableViewController {
    
    var functions = [Function]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FuncTableViewCell.nib(), forCellReuseIdentifier: FuncTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = .systemGray5
        
        title = "Net Info"
        
        functions = Data().loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return functions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: FuncTableViewCell.identifier, for: indexPath) as! FuncTableViewCell
        
        let function = functions[indexPath.row]
        customCell.funcImageView.image = function.funcImage
        customCell.funcLabel.text = function.funcName
        customCell.backgroundColor = .clear
        
        // Set cell's accessory type
        customCell.accessoryType = .disclosureIndicator
        
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if let vc = storyboard?.instantiateViewController(identifier: "Gateway") as? GatewayViewController {
                vc.pageTitle = functions[indexPath.row].funcName
                navigationController?.pushViewController(vc, animated: true)
            }
        case 1:
            if let vc = storyboard?.instantiateViewController(identifier: "PortScaner") as? PortScanerViewController {
                vc.pageTitle = functions[indexPath.row].funcName
                navigationController?.pushViewController(vc, animated: true)
            }
        default:
            print("TBD")
        } 
    }


}

