//
//  ForgetViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/1.
//

import UIKit

class ForgetViewController: BaseViewController {

    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.layer.cornerRadius = 10.0
            bgView.layer.borderColor = UIColor.init(hexString: "bc7ece").cgColor
            bgView.layer.borderWidth = 2.0
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = UIColor.init(hexString: "ffffff")
            titleLabel.text = HVForget.title
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

    @IBOutlet weak var accountTextField: UITextField! {
        didSet {
            accountTextField.setPlaceHolder(placeHolder: HVForget.Placeholder.account, color: UIColor.init(hexString: "a9a9a9"))
        }
    }
    
    @IBOutlet weak var typeView: UIView! {
        didSet {
            typeView.layer.cornerRadius = 4.0
            typeView.layer.borderWidth = 1.0
            typeView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            typeView.backgroundColor = UIColor.init(hexString: "34097f")
        }
    }
    @IBOutlet weak var typeLabel: UILabel! {
        didSet {
            typeLabel.text = HVForget.SendType.phone
            typeLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var typeButton: UIButton!
    
    @IBOutlet weak var phoneView: UIView! {
        didSet {
            phoneView.layer.cornerRadius = 4.0
            phoneView.layer.borderWidth = 1.0
            phoneView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            phoneView.backgroundColor = UIColor.init(hexString: "ffffff", alpha: 0.3)
        }
    }

    @IBOutlet weak var phoneTextField: UITextField! {
        didSet {
            phoneTextField.setPlaceHolder(placeHolder: HVForget.Placeholder.phone, color: UIColor.init(hexString: "a9a9a9"))
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
    
    @IBOutlet weak var verifyTextField: UITextField! {
        didSet {
            verifyTextField.setPlaceHolder(placeHolder: HVForget.Placeholder.verify, color: UIColor.init(hexString: "a9a9a9"))
        }
    }
    @IBOutlet weak var verifyCodeImageView: UIImageView!
    
    @IBOutlet weak var sendButton: UIButton! {
        didSet {
            sendButton.layer.cornerRadius = 4.0
            sendButton.setTitle(HVForget.Button.send, for: .normal)
        }
    }
    
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
    
    @IBAction func typeSelectAction(_ sender: Any) {
        
    }
    
    @IBAction func send(_ sender: Any) {
        
    }
}

extension ForgetViewController: ViewControllerable {
    func setup() {
        
    }
    
    func setupView() {
        let colors = [UIColor(hexString: "2d0b6c").cgColor,
                      UIColor(hexString: "3b0ea6").cgColor,
                      UIColor(hexString: "2c0b69").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 1], direction: .topToBottom)
        bgView.applyGradient(gradientMaker: gradient)
        
        let sendColors = [UIColor(hexString: "c8f5f8").cgColor,
                      UIColor(hexString: "2f6b73").cgColor,
                      UIColor(hexString: "73c7d0").cgColor]
        let sendGradient = UIColor.GradientMaker(colors: sendColors, locations: [0, 0.51, 1], direction: .topToBottom)
        
        sendButton.applyGradient(gradientMaker: sendGradient)
    }
    
    func setupViewModel() {
        
    }
    
    
}
