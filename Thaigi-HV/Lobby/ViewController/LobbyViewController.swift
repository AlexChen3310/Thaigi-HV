//
//  LobbyViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/12.
//

import UIKit

class LobbyViewController: BaseViewController {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var personalButton: UIButton!
    @IBOutlet weak var vipView: UIView!
    @IBOutlet weak var vipImageView: UIImageView!
    @IBOutlet weak var vipLabel: UILabel! {
        didSet {
            vipLabel.layer.cornerRadius = 7.0
            vipLabel.backgroundColor = UIColor.init(hexString: "275ea7")
            vipLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    @IBOutlet weak var vipButton: UIButton!
    @IBOutlet weak var giftButton: UIButton!
    
    @IBOutlet weak var diamondView: UIView! {
        didSet {
            diamondView.layer.borderColor = UIColor.init(hexString: "9cbdfa").cgColor
            diamondView.layer.borderWidth = 1.0
            diamondView.layer.cornerRadius = 14.0
            diamondView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var diamondLabel: UILabel!
    
    @IBOutlet weak var moneyView: UIView! {
        didSet {
            moneyView.layer.borderColor = UIColor.init(hexString: "9cbdfa").cgColor
            moneyView.layer.borderWidth = 1.0
            moneyView.layer.cornerRadius = 14.0
            moneyView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    @IBOutlet weak var rankView: UIView!
    @IBOutlet weak var rankImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel! {
        didSet {
            rankLabel.layer.borderColor = UIColor.init(hexString: "9cbdfa").cgColor
            rankLabel.layer.borderWidth = 1.0
            rankLabel.textColor = UIColor.init(hexString: "f6eac7")
            rankLabel.layer.cornerRadius = 4.0
        }
    }
    @IBOutlet weak var rankButton: UIButton!
    
    @IBOutlet weak var settingButton: UIButton!
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var recommendButton: UIButton!
    
    @IBOutlet weak var bonusView: UIView!
    @IBOutlet weak var bonusImage: UIImageView!
    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var bonusButton: UIButton!
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var serviceView: UIView!
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var serviceButton: UIButton!
    
    @IBOutlet weak var depositButton: UIButton!
    
    
    @IBOutlet weak var leftView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        setupView()
        setupViewModel()
    }
    
    @IBAction func personalAction(_ sender: Any) {
        
    }
    
    @IBAction func vipAction(_ sender: Any) {
        
    }
    
    @IBAction func giftAction(_ sender: Any) {
        
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        
    }
    
    @IBAction func rankAction(_ sender: Any) {
        
    }
    
    @IBAction func settingAction(_ sender: Any) {
        
    }
    
    @IBAction func recommendAction(_ sender: Any) {
        
    }
    
    @IBAction func bonusAction(_ sender: Any) {
        
    }
    
    @IBAction func messageAction(_ sender: Any) {
        
    }
    
    @IBAction func serviceAction(_ sender: Any) {
        
    }
    
    @IBAction func depositAction(_ sender: Any) {
        
    }
}

extension LobbyViewController: ViewControllerable {
    func setup() {
        
    }
    
    func setupView() {
        let colors = [UIColor(hexString: "141926").cgColor,
                      UIColor(hexString: "232e53").cgColor,]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 0.5, 1], direction: .topToBottom)
        footerView.applyGradient(gradientMaker: gradient)
        topView.applyGradient(gradientMaker: gradient)
        
        let leftColors = [UIColor(hexString: "13161e").cgColor,
                          UIColor(hexString: "604117").cgColor,
                          UIColor(hexString: "13161e").cgColor]
        let leftGradient = UIColor.GradientMaker(colors: leftColors, locations: [0, 0.5, 1], direction: .topToBottom)
        leftView.applyGradient(gradientMaker: leftGradient)
    }
    
    func setupViewModel() {
        
    }
}
