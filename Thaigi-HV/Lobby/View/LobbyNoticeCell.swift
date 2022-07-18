//
//  LobbyNoticeCell.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/15.
//

import UIKit

class LobbyNoticeCell: UICollectionViewCell {

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
