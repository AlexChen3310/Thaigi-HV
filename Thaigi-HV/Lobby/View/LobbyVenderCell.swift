//
//  LobbyVenderCell.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/15.
//

import UIKit

class LobbyVenderCell: UICollectionViewCell {

    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.init(hexString: "e9d9f2")
        }
    }
    @IBOutlet weak var underLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let colors = [UIColor(hexString: "13161e").cgColor,
                      UIColor(hexString: "604117").cgColor,
                      UIColor(hexString: "13161e").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 0.5, 1], direction: .leftToRight)
        underLine.applyGradient(gradientMaker: gradient)
    }

}
