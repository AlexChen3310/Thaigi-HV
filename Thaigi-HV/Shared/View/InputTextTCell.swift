//
//  InputTextTCell.swift
//  imf88
//
//  Created by Johnny on 2020/8/19.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import LCNibBridge

class InputTextTCell: UITableViewCell {
    
    @IBOutlet weak var inputTextView: InputTextView!
    
    var textDidChange: ((String) -> ())?
    
    @IBOutlet var paddingConstraints: [NSLayoutConstraint]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func changePadding(padding: CGFloat){
        paddingConstraints.forEach { item in
            item.constant = padding
        }
    }
}
extension InputTextTCell: ViewConfigurable{
    func configure(viewModel: InputTextViewCellViewModel) {
        
        inputTextView.titleLabel.text = viewModel.title
        inputTextView.titleLabel.textColor = viewModel.titleColor
        inputTextView.inputTextField.textColor = viewModel.contentColor
        inputTextView.inputTextField.text = viewModel.content
        inputTextView.inputTextField.delegate = self
        inputTextView.inputTextField.isUserInteractionEnabled = viewModel.canEditing
        inputTextView.inputTextField.keyboardType = viewModel.keyboardType
        inputTextView.inputTextField.isSecureTextEntry = viewModel.isSecureTextEntry
        inputTextView.hintLabel.text = viewModel.hint
        inputTextView.hintLabel.textColor = viewModel.hintColor
        inputTextView.hintLabel.isHidden = !viewModel.showHint
        inputTextView.inputTextField.setPlaceHolder(placeHolder: viewModel.placeHolder, color: viewModel.placeHolderColor)
        inputTextView.iconImageView.image = viewModel.iconImage
        inputTextView.iconImageViewWidth.constant = viewModel.iconImage == nil ? 0 : 24
        inputTextView.radiusView.layer.borderColor = viewModel.unFocusColor.cgColor
    }
}
extension InputTextTCell: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        inputTextView.radiusView.layer.borderColor = UIColor.white.cgColor
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        inputTextView.radiusView.layer.borderColor = UIColor.white.cgColor
        textDidChange?(textField.text ?? "")
    }
}
