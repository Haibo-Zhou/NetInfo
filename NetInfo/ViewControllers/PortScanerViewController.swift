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
    @IBOutlet weak var serverImageView: UIImageView!
    @IBOutlet weak var portRangeImageView: UIImageView!
    @IBOutlet weak var scanerIndicator: UIActivityIndicatorView!
    @IBOutlet weak var serverLabel: UILabel!
    @IBOutlet weak var openPortLabel: UILabel!
    
    @IBOutlet var table: UITableView!
    
    var openPorts = [Int]()
    let netUtility = NetworkUtility()
    var pageTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(startScan))
        configure()
        
    }
    
    private func configure() {
        // Image
        serverImageView.image = UIImage(systemName: "externaldrive.badge.checkmark")
        portRangeImageView.image = UIImage(systemName: "externaldrive.badge.plus")
        
        // Activity indicator
        scanerIndicator.color = .systemYellow
        scanerIndicator.hidesWhenStopped = true
        scanerIndicator.stopAnimating()
        view.backgroundColor = .systemGray5
        
        // TableView
        title = pageTitle
        table.backgroundColor = .lightGreen
        table.separatorColor = .systemGray3
        
        // Text font & color
        serverAddress.backgroundColor = .systemGray6
        serverAddress.keyboardType = .numbersAndPunctuation
        startPort.backgroundColor = .systemGray6
        startPort.keyboardType = .numberPad
        stopPort.backgroundColor = .systemGray6
        stopPort.keyboardType = .numberPad
        
        serverLabel.backgroundColor = .clear
        serverLabel.numberOfLines = 1
        serverLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        serverLabel.adjustsFontForContentSizeCategory = true
        serverLabel.textColor = .textColor
        
        openPortLabel.backgroundColor = .clear
        openPortLabel.numberOfLines = 1
        openPortLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        openPortLabel.adjustsFontForContentSizeCategory = true
        openPortLabel.textColor = .textColor
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func startScan() {
        scanerIndicator.startAnimating()
        openPorts.removeAll()
        table.reloadData()
        view.endEditing(true)
//        self.view.isUserInteractionEnabled = false
        
        if let address = serverAddress.text, !address.isEmpty {
            if let start = Int(startPort.text!) {
                if let stop = Int(stopPort.text!) {
                    if start < stop {
                        netUtility.scanPorts(address: address, start: start, stop: stop) { [self] (availablePorts) in
                            openPorts = availablePorts
                            print("Opened ports: \(self.openPorts)")
                            if !openPorts.isEmpty {
                                DispatchQueue.main.async { [weak self] in
                                    table.reloadData()
                                    self?.scanerIndicator.stopAnimating()
                                }
                            } else {
                                DispatchQueue.main.async { [weak self] in
                                    table.reloadData()
                                    self?.scanerIndicator.stopAnimating()
                                }
                                showErrorMessage(errorTitle: "Not at all", errorMessage: "No open ports were found")
                            }
                        }
                    } else {
                        scanerIndicator.stopAnimating()
                        showErrorMessage(errorTitle: "Range error", errorMessage: "Start port should be smaller than stop port")
                    }
                } else {
                    scanerIndicator.stopAnimating()
                    showErrorMessage(errorTitle: "Empty fields", errorMessage: "Please fill all the necessary data")
                }
            } else {
                scanerIndicator.stopAnimating()
                showErrorMessage(errorTitle: "Empty fields", errorMessage: "Please fill all the necessary data")
            }
        } else {
            scanerIndicator.stopAnimating()
            showErrorMessage(errorTitle: "Empty fields", errorMessage: "Please fill all the necessary data")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return openPorts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(openPorts[indexPath.row])
        cell.backgroundColor = .clear
        
        return cell
    }
    

}
