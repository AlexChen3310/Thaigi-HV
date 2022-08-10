//
//  PersonalViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/9.
//

import UIKit

enum PersonalType: Int{
    case user = 0, record, cange
}

class PersonalViewController: BaseViewController {

    struct ViewState {
        unowned var currentScrollView:UIScrollView?
    }
    var viewState = ViewState()
    
    let userContentVC = UserViewController(nibName: "UserViewController", bundle: nil)
    
    private var personalPageViewController: PersonalPageViewController?
    
    public var personalType: PersonalType = .user
    
    @IBOutlet weak var boardView: UIView! {
        didSet {
            boardView.layer.cornerRadius = 10.0
            boardView.layer.borderColor = UIColor.init(hexString: "bc7ece").cgColor
            
        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 4.0
            containerView.backgroundColor = UIColor.init(hexString: "1b0545")
        }
    }
    
    @IBOutlet weak var userButton: UIButton! {
        didSet {
            userButton.setTitle(HVPersonal.Button.user, for: .normal)
            userButton.layer.cornerRadius = 4.0
            userButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            userButton.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var recodeButton: UIButton! {
        didSet {
            recodeButton.setTitle(HVPersonal.Button.record, for: .normal)
            recodeButton.layer.cornerRadius = 4.0
            recodeButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            recodeButton.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet weak var changeButton: UIButton! {
        didSet {
            changeButton.setTitle(HVPersonal.Button.password, for: .normal)
            changeButton.layer.cornerRadius = 4.0
            changeButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            changeButton.layer.borderWidth = 1.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        setupView()
        setupViewModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToPageView" {
        
            personalPageViewController = segue.destination as? PersonalPageViewController
            personalPageViewController?.setContentViewControllers([userContentVC, userContentVC, userContentVC], delegate: self)
        }
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func typeButtonAction(_ sender: Any) {
        guard let clickedButton = sender as? UIButton else { return }
        let type = PersonalType(rawValue: clickedButton.tag)
        
        switch type {
        case .user:
            selectButon(userButton)
            unSelectButon(recodeButton)
            unSelectButon(changeButton)
        case .record:
            selectButon(recodeButton)
            unSelectButon(userButton)
            unSelectButon(changeButton)
        case .cange:
            selectButon(changeButton)
            unSelectButon(recodeButton)
            unSelectButon(userButton)
        case .none:
            print("Error Button")
        }
        
        personalPageViewController?.willMoveToViewControllerAtIndex(index: clickedButton.tag, pressedView: clickedButton)
    }
}

extension PersonalViewController: ViewControllerable {
    func setup() {
        
    }
    
    func setupView() {
        let colors = [UIColor(hexString: "2d0b6c").cgColor,
                      UIColor(hexString: "3b0ea6").cgColor,
                      UIColor(hexString: "2c0b69").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 0.5, 1], direction: .leftToRight)
        boardView.applyGradient(gradientMaker: gradient)
        selectButon(userButton)
        unSelectButon(recodeButton)
        unSelectButon(changeButton)
    }
    
    func setupViewModel() {
        
    }
    
    private func selectButon(_ button: UIButton) {
        let colors = [UIColor(hexString: "4d2099").cgColor,
                      UIColor(hexString: "390587").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 1], direction: .topToBottom)
        button.applyGradient(gradientMaker: gradient)
        button.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
    }
    
    private func unSelectButon(_ button: UIButton) {
        let colors = [UIColor(hexString: "4d2099").cgColor,
                      UIColor(hexString: "1d1049").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 1], direction: .topToBottom)
        button.applyGradient(gradientMaker: gradient)
        button.layer.borderColor = UIColor.init(hexString: "1c0a3b").cgColor
    }
}

extension PersonalViewController: PersonalPageDelegate {
    func pageScrollFinished(index: Int) {
        
    }
}
