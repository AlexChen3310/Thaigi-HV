//
//  SettingSelectCell.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/5.
//

import UIKit

class SettingSelectCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    @IBOutlet weak var rightView: UIView! {
        didSet {
            rightView.layer.borderWidth = 1.0
            rightView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            rightView.layer.cornerRadius = 4.0
            rightView.backgroundColor = UIColor.init(hexString: "3d186e")
        }
    }
    @IBOutlet weak var rightLabel: UILabel! {
        didSet {
            rightLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    @IBOutlet weak var rightImageView: UIImageView! {
        didSet {
            rightImageView.image = UIImage(named: "setting_arrow")
        }
    }
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var underLine: UIView!
    
    var view: UIView?
    var selectView: SettingSelectView!
    
    var isOpneSelect: Bool = false
    var openSelectView: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let colors = [UIColor(hexString: "2d0b6c").cgColor,
                      UIColor(hexString: "3b0ea6").cgColor,
                      UIColor(hexString: "2c0b69").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 1], direction: .leftToRight)
        underLine.applyGradient(gradientMaker: gradient)
        selectView = (UINib(nibName: "SettingSelectView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! SettingSelectView)
        
        selectView.frame = CGRect(x: self.rightView.frame.origin.x,
                                  y: 37,
                                  width: self.rightView.frame.width,
                                  height: 87)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func openSelectView(_ sender: Any) {
        self.isOpneSelect = !self.isOpneSelect
        if let v = view {
            if isOpneSelect {
                v.addSubview(selectView)
            } else {
                selectView.removeFromSuperview()
            }
        }
        if let callback = openSelectView {
            callback(self.isOpneSelect)
        }
    }
}

extension SettingSelectCell {
    func congfig(_ data: SettingCellViewModel, view: UIView) {
        self.view = view
        self.iconImageView.image = UIImage(named: data.imageName)
        self.titleLabel.text = data.title
    }
}
