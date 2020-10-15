//
//  PortScanerViewController.swift
//  NetInfo
//
//  Created by Chuck.Zhou on 10/15/20.
//

import UIKit

class PortScanerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var serverAddress: UITextField!
    @IBOutlet weak var startPort: UITextField!
    @IBOutlet weak var stopPort: UITextField!
    
    @IBOutlet var table: UITableView!
    
    var openPorts = [Int]()
    let netUtility = NetworkUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(startScan))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func startScan() {
        if let address = serverAddress.text, !address.isEmpty {
            if let start = Int(startPort.text!) {
                if let stop = Int(stopPort.text!) {
                    if start < stop {
                        openPorts = netUtility.scanPorts(address: address, start: start, stop: stop)
                        if !openPorts.isEmpty {
                            table.reloadData()
                        } else {
                            showErrorMessage(errorTitle: "Not at all", errorMessage: "No open ports were found")
                        }
                    } else {
                        showErrorMessage(errorTitle: "Range error", errorMessage: "Start port should be smaller than stop port")
                    }
                } else {
                    showErrorMessage(errorTitle: "Empty fields", errorMessage: "Please fill all the necessary data")
                }
            } else {
                showErrorMessage(errorTitle: "Empty fields", errorMessage: "Please fill all the necessary data")
            }
        } else {
            showErrorMessage(errorTitle: "Empty fields", errorMessage: "Please fill all the necessary data")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return openPorts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(openPorts[indexPath.row])
        
        return cell
    }
}