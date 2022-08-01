//
//  LoginViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/19.
//

import UIKit

class LoginViewController: BaseViewController {

    
    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.layer.borderColor = UIColor.init(hexString: "bc7ece").cgColor
            bgView.layer.borderWidth = 2.0
            bgView.layer.cornerRadius = 10.0
        }
    }
    
    @IBOutlet weak var logoImageView: UIView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = HVLogin.title
            titleLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    
    @IBOutlet weak var mainView: UIView! {
        didSet {
            mainView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            mainView.layer.borderWidth = 1.0
            mainView.layer.cornerRadius = 4.0
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
            accountTextField.setPlaceHolder(placeHolder: HVLogin.PlaceHolder.account, color: UIColor.init(hexString: "a9a9a9"))
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
            passwordTextField.setPlaceHolder(placeHolder: HVLogin.PlaceHolder.password, color: UIColor.init(hexString: "a9a9a9"))
        }
    }
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 4.0
            loginButton.setTitleColor(UIColor.init(hexString: "ffffff"), for: .normal)
            loginButton.setTitle(HVLogin.Button.login, for: .normal)
        }
    }
    
    @IBOutlet weak var rememberView: UIView! {
        didSet {
            rememberView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var rememberImageView: UIImageView! {
        didSet {
            rememberImageView.layer.cornerRadius = 4.0
            rememberImageView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.1)
        }
    }
    @IBOutlet weak var rememberLabel: UILabel! {
        didSet {
            rememberLabel.text = HVLogin.Button.remember
            rememberLabel.textColor = UIColor.init(hexString: "a9a9a9")
        }
    }
    @IBOutlet weak var rememberButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            
        }
    }
    @IBOutlet weak var forgetButton: UIButton!
    
    @IBOutlet weak var serviceButton: UIButton!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        setupView()
        setupViewModel()
    }
    
    @IBAction func loginAction(_ sneder: Any) {
        viewModel.login()
    }
    
    @IBAction func rememberAction(_ sender: Any) {
        
    }
    
    @IBAction func registerAction(_ sender: Any) {
        ViewControllerManager.present(to: Target.register)
    }
    
    @IBAction func forgetAction(_ sender: Any) {
        ViewControllerManager.present(to: Target.forget)
    }
    
    @IBAction func serviceAction(_ sender: Any) {
        
    }
    
    @IBAction func accountChange(_ sender: Any) {
        guard let text = accountTextField.text else { return }
        viewModel.request.account = text
    }
    
    @IBAction func passwordChange(_ sender: Any) {
        guard let text = passwordTextField.text else { return }
        viewModel.request.password = text
    }
}

extension LoginViewController: ViewControllerable {
    func setup() {
        
    }
    
    func setupView() {
        let colors = [UIColor(hexString: "2d0b6c").cgColor,
                      UIColor(hexString: "3b0ea6").cgColor,
                      UIColor(hexString: "2c0b69").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 1], direction: .topToBottom)
        bgView.applyGradient(gradientMaker: gradient)
        
        let loginColors = [UIColor(hexString: "c8f5f8").cgColor,
                      UIColor(hexString: "2f6b73").cgColor,
                      UIColor(hexString: "73c7d0").cgColor]
        let loginGradient = UIColor.GradientMaker(colors: loginColors, locations: [0, 0.51, 1], direction: .topToBottom)
        
        loginButton.applyGradient(gradientMaker: loginGradient)
    }
    
    func setupViewModel() {
        viewModel.changeButtonStatus = { [weak self] status in
            guard let strongSelf = self else { return }
            strongSelf.loginButton.isEnabled = status
        }
        
        viewModel.updateLoadingStatus = { needShow in
            DispatchQueue.main.async {
                self.updateLoadingStatus(needShow: needShow)
            }
        }
        
        viewModel.updateView = {
            ViewControllerManager.present(to: Target.lobby)
        }
        
        viewModel.bind()
    }
}
