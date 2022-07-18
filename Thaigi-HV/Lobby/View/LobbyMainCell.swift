//
//  LobbyMainCell.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/18.
//

import UIKit

class LobbyMainCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.backgroundColor = UIColor.init(hexString: "e3bd58")
            bgView.layer.borderWidth = 2.0
            bgView.layer.borderColor = UIColor.init(hexString: "f4cf72").cgColor
            bgView.layer.cornerRadius = 4.0
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
