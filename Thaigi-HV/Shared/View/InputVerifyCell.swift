//
//  InputVerifyCell.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/2.
//

import UIKit

class InputVerifyCell: UITableViewCell {

    @IBOutlet weak var verifyView: UIView! {
        didSet {
            verifyView.layer.cornerRadius = 4.0
            verifyView.layer.borderWidth = 1.0
            verifyView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            verifyView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.3)
        }
    }
    @IBOutlet weak var verifyImageView: UIImageView! {
        didSet {
            verifyImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            verifyImageView.layer.cornerRadius = 4.0
            verifyImageView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.5)
        }
    }
    @IBOutlet weak var verifyTextField: UITextField! {
        didSet {
            verifyTextField.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    @IBOutlet weak var verifyCodeImageView: UIImageView! {
        didSet {
            verifyCodeImageView.layer.cornerRadius = 4
            verifyCodeImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
    
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
        guard let text = verifyTextField.text, let callback = valueChange else { return }
        callback(text)
    }
}

extension InputVerifyCell {
    func config(_ viewModel: RegisterCellViewModel) {
        errorView.isHidden = !viewModel.error
        verifyImageView.image = UIImage(named: viewModel.imageName)
        verifyTextField.setPlaceHolder(placeHolder: viewModel.placeholder, color: UIColor.init(hexString: "a9a9a9"))
        verifyTextField.text = viewModel.value
        errorLabel.text = viewModel.errorMessage
        if let image = viewModel.verify {
            verifyCodeImageView.image = image
        }
    }
}

extension InputVerifyCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let callback = endChange else { return }
        callback(text)
    }
}
