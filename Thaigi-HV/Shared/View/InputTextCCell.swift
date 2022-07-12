//
//  InputTextCCell.swift
//  TFChessApp
//
//  Created by Johnny on 2021/12/15.
//

import UIKit
import LCNibBridge

class InputTextCCell: UICollectionViewCell {

    @IBOutlet weak var inputTextView: InputTextView!
    
    var textDidChange: ((String) -> ())?
    
    @IBOutlet weak var editTitleLabel: UILabel!{
        didSet{
            editTitleLabel.text = "修改"
            editTitleLabel.textColor = .white
        }
    }
    @IBOutlet weak var editIconImageView: UIImageView!{
        didSet{
            let icon = UIImage(named: "ic_edit")?.changeImageToColor(.white)
            editIconImageView.image = icon
        }
    }
    @IBOutlet weak var editContolView: UIControl!
    
    var willGoEditPage: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func editButtonPressed(_ sender: Any) {
        willGoEditPage?()
    }
}
extension InputTextCCell: ViewConfigurable{
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
        editContolView.isHidden = !viewModel.canBeChanged
    }
}
extension InputTextCCell: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        inputTextView.radiusView.layer.borderColor = UIColor.white.cgColor
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        inputTextView.radiusView.layer.borderColor = UIColor.white.cgColor
        textDidChange?(textField.text ?? "")
    }
}
