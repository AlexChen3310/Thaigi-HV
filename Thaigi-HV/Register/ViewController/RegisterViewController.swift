//
//  RegisterViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/22.
//

import UIKit

class RegisterViewController: BaseViewController {

    let viewModel = RegisterViewModel(try! VerifyViewModel())
    
    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.layer.cornerRadius = 10.0
            bgView.layer.borderColor = UIColor.init(hexString: "bc7ece").cgColor
            bgView.layer.borderWidth = 2.0
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = HVRegister.title
        }
    }
    
    @IBOutlet weak var mainView: UIView! {
        didSet {
            mainView.layer.cornerRadius = 4.0
            mainView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            mainView.layer.borderWidth = 1.0
            mainView.backgroundColor = UIColor.init(hexString: "1b0545")
        }
    }
    
    @IBOutlet weak var accountView: UIView! {
        didSet {
            accountView.layer.cornerRadius = 4.0
            accountView.layer.borderWidth = 1.0
            accountView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            accountView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.3)
        }
    }
    @IBOutlet weak var accountImageView: UIImageView! {
        didSet {
            accountImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            accountImageView.layer.cornerRadius = 4.0
            accountImageView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.5)
        }
    }
    @IBOutlet weak var accountTextField: UITextField! {
        didSet {
            accountTextField.setPlaceHolder(placeHolder: HVRegister.Placeholder.account, color: UIColor.init(hexString: "a9a9a9"))
        }
    }
    
    @IBOutlet weak var passwordView: UIView! {
        didSet {
            passwordView.layer.cornerRadius = 4.0
            passwordView.layer.borderWidth = 1.0
            passwordView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            passwordView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.3)
        }
    }
    @IBOutlet weak var passwordImageView: UIImageView! {
        didSet {
            passwordImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            passwordImageView.layer.cornerRadius = 4.0
            passwordImageView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.5)
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.setPlaceHolder(placeHolder: HVRegister.Placeholder.password, color: UIColor.init(hexString: "a9a9a9"))
        }
    }
    
    @IBOutlet weak var againView: UIView! {
        didSet {
            againView.layer.cornerRadius = 4.0
            againView.layer.borderWidth = 1.0
            againView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            againView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.3)
        }
    }
    @IBOutlet weak var againImageView: UIImageView! {
        didSet {
            againImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            againImageView.layer.cornerRadius = 4.0
            againImageView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.5)
        }
    }
    
    @IBOutlet weak var againTextField: UITextField! {
        didSet {
            againTextField.setPlaceHolder(placeHolder: HVRegister.Placeholder.again, color: UIColor.init(hexString: "a9a9a9"))
        }
    }
    
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
            verifyTextField.setPlaceHolder(placeHolder: HVRegister.Placeholder.verify, color: UIColor.init(hexString: "a9a9a9"))
        }
    }
    @IBOutlet weak var verifyCodeImageView: UIImageView! {
        didSet {
            verifyCodeImageView.layer.cornerRadius = 4
            verifyCodeImageView.image = viewModel.verify.image
            verifyCodeImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.layer.cornerRadius = 4.0
            registerButton.setTitle(HVRegister.Button.register, for: .normal)
        }
    }
    @IBOutlet weak var registerClose: UIButton!
    
    @IBOutlet weak var treatyView: UIView! {
        didSet {
            treatyView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var treatyImageView: UIImageView! {
        didSet {
            treatyImageView.layer.cornerRadius = 4.0
            treatyImageView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.1)
        }
    }
    @IBOutlet weak var treatyLabel: UILabel! {
        didSet {
            treatyLabel.text = HVRegister.Treaty.treaty
            treatyLabel.textColor = UIColor.init(hexString: "a9a9a9")
        }
    }
    @IBOutlet weak var treatyButton: UIButton!
    @IBOutlet weak var serviceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        setupView()
        setupViewModel()
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func serviceAction(_ sender: Any) {
        
    }
}

extension RegisterViewController: ViewControllerable {
    func setup() {
        
    }
    
    func setupView() {
        let colors = [UIColor(hexString: "2d0b6c").cgColor,
                      UIColor(hexString: "3b0ea6").cgColor,
                      UIColor(hexString: "2c0b69").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 1], direction: .topToBottom)
        bgView.applyGradient(gradientMaker: gradient)
        
        let registerColors = [UIColor(hexString: "c8f5f8").cgColor,
                      UIColor(hexString: "2f6b73").cgColor,
                      UIColor(hexString: "73c7d0").cgColor]
        let registerGradient = UIColor.GradientMaker(colors: registerColors, locations: [0, 0.51, 1], direction: .topToBottom)
        
        registerButton.applyGradient(gradientMaker: registerGradient)
    }
    
    func setupViewModel() {
        
    }
}
