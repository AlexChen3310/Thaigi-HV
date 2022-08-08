//
//  SettingSwitchCell.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/5.
//

import UIKit

class SettingSwitchCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    
    @IBOutlet weak var switchView: UIView! {
        didSet {
            switchView.layer.borderWidth = 1.0
            switchView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            switchView.layer.cornerRadius = 4.0
            switchView.backgroundColor = UIColor.init(hexString: "3d186e")
        }
    }
    @IBOutlet weak var onButton: UIButton! {
        didSet {
            onButton.layer.cornerRadius = 4.0
            onButton.setTitleColor(UIColor.init(hexString: "ffffff"), for: .normal)
            onButton.setTitle(HVSetting.Switch.on, for: .normal)
        }
    }
    @IBOutlet weak var offButton: UIButton! {
        didSet {
            offButton.layer.cornerRadius = 4.0
            offButton.setTitleColor(UIColor.init(hexString: "ffffff"), for: .normal)
            offButton.setTitle(HVSetting.Switch.off, for: .normal)
        }
    }
    
    @IBOutlet weak var underLine: UIView!
    
    var viewModel: SettingCellViewModel?
    
    var switchCallBack: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let colors = [UIColor(hexString: "2d0b6c").cgColor,
                      UIColor(hexString: "3b0ea6").cgColor,
                      UIColor(hexString: "2c0b69").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 1], direction: .leftToRight)
        
        
        
        underLine.applyGradient(gradientMaker: gradient)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchAction(_ sender: Any) {
        if let callback = switchCallBack {
            callback()
        }
    }
}

extension SettingSwitchCell {
    func congfig(_ data: SettingCellViewModel) {
        self.viewModel = data
        self.iconImageView.image = UIImage(named: data.imageName)
        self.titleLabel.text = data.title
        
        if data.isOpen {
            openButton(onButton)
            closeButton(offButton)
        } else {
            openButton(offButton)
            closeButton(onButton)
        }
    }
    
    
    private func openButton(_ button: UIButton) {
        let colors = [UIColor(hexString: "c8f5f8").cgColor,
                      UIColor(hexString: "2f6b73").cgColor,
                      UIColor(hexString: "73c7d0").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 0.51, 1], direction: .topToBottom)
        
        button.applyGradient(gradientMaker: gradient)
    }
    
    private func closeButton(_ button: UIButton) {
        let colors = [UIColor.clear.cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 1], direction: .topToBottom)
        
        button.applyGradient(gradientMaker: gradient)
    }
}
