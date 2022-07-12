//
//  InputTextView.swift
//  imf88
//
//  Created by Johnny on 2020/8/19.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import LCNibBridge
class InputTextView: UIView, LCNibBridge {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var radiusView: UIView!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconImageViewWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        radiusView.layer.cornerRadius = 4
        radiusView.layer.borderWidth = 1
//        radiusView.layer.borderColor = R.color.bluey_grey()?.cgColor
        let clearButton = inputTextField.value(forKey: "_clearButton") as? UIButton
        clearButton?.setImage(UIImage(named: "cancel18Px")?.changeImageToColor(.white, alpha: 1), for: .normal)
        inputTextField.clearButtonMode = .whileEditing
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
