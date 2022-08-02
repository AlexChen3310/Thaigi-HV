//
//  InputTextCell.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/2.
//

import UIKit

class InputTextCell: UITableViewCell {

    @IBOutlet weak var enterView: UIView! {
        didSet {
            enterView.layer.cornerRadius = 4.0
            enterView.layer.borderWidth = 1.0
            enterView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            enterView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.3)
        }
    }
    @IBOutlet weak var inputImageView: UIImageView! {
        didSet {
            inputImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            inputImageView.layer.cornerRadius = 4.0
            inputImageView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.5)
        }
    }
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    var valueChange: ((String) -> Void)?
    var endChange: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func valueChange(_ sender: Any) {
        guard let text = inputTextField.text, let callback = valueChange else { return }
        callback(text)
    }
    
    @IBAction func endChange(_ sender: Any) {
        guard let text = inputTextField.text, let callback = endChange else { return }
        callback(text)
    }
}

extension InputTextCell {
    func config(_ viewModel: RegisterCellViewModel) {
        errorView.isHidden = !viewModel.error
        errorLabel.text = viewModel.errorMessage
        inputImageView.image = UIImage(named: viewModel.imageName)
        inputTextField.text = viewModel.value
        inputTextField.setPlaceHolder(placeHolder: viewModel.placeholder, color: UIColor.init(hexString: "a9a9a9"))
    }
}

extension InputTextCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let callback = endChange else { return }
        callback(text)
    }
}
