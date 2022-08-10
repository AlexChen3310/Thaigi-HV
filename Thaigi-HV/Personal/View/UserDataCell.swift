//
//  UserDataCell.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/10.
//

import UIKit

class UserDataCell: UITableViewCell {

    @IBOutlet weak var boardView: UIView! {
        didSet {
            boardView.layer.cornerRadius = 4.0
            boardView.backgroundColor = UIColor.init(hexString: "34097f")
        }
    }
    @IBOutlet weak var pointView: UIView! {
        didSet {
            pointView.layer.cornerRadius = 3.0
            pointView.backgroundColor = UIColor.init(hexString: "bb2619")
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.init(hexString: "fcef4f")
        }
    }
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    @IBOutlet weak var rightButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
