//
//  FuncTableViewCell.swift
//  NetInfo
//
//  Created by Chuck.Zhou on 10/14/20.
//

import UIKit

class FuncTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FuncTableViewCell", bundle: nil)
    }
    
    @IBOutlet var funcImageView: UIImageView!
    @IBOutlet var funcLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Customize imageView
        funcImageView.contentMode = .scaleAspectFit
        
        // Customize label text
        funcLabel.backgroundColor = .clear
        funcLabel.numberOfLines = 1
        // Dynamic text 
        funcLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        funcLabel.adjustsFontForContentSizeCategory = true
        // Dynamic color for dark/light mode
        funcLabel.textColor = .label
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
