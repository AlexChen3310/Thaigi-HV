//
//  UserTwoDataCell.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/10.
//

import UIKit

class UserTwoDataCell: UITableViewCell {

    @IBOutlet weak var leftBoardView: UIView! {
        didSet {
            leftBoardView.layer.cornerRadius = 4.0
            leftBoardView.backgroundColor = UIColor.init(hexString: "34097f")
        }
    }
    @IBOutlet weak var leftPointView: UIView! {
        didSet {
            leftPointView.layer.cornerRadius = 3.0
            leftPointView.backgroundColor = UIColor.init(hexString: "bb2619")
        }
    }
    @IBOutlet weak var leftTitleLabel: UILabel! {
        didSet {
            leftTitleLabel.textColor = UIColor.init(hexString: "fcef4f")
        }
    }
    @IBOutlet weak var leftIconImageView: UIImageView!
    @IBOutlet weak var leftTextField: UITextField! {
        didSet {
            leftTextField.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightBoardView: UIView! {
        didSet {
            rightBoardView.layer.cornerRadius = 4.0
            rightBoardView.backgroundColor = UIColor.init(hexString: "34097f")
        }
    }
    @IBOutlet weak var rightPointView: UIView! {
        didSet {
            rightPointView.layer.cornerRadius = 3.0
            rightPointView.backgroundColor = UIColor.init(hexString: "bb2619")
        }
    }
    @IBOutlet weak var rightTitleLabel: UILabel! {
        didSet {
            rightTitleLabel.textColor = UIColor.init(hexString: "fcef4f")
        }
    }
    @IBOutlet weak var rightIconImageView: UIImageView!
    @IBOutlet weak var rightTextField: UITextField! {
        didSet {
            rightTextField.textColor = UIColor.init(hexString: "ffffff")
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
