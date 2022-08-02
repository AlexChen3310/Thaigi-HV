//
//  RegisterViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/22.
//

import UIKit

class RegisterViewController: BaseTableViewController {

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
        regiestCell()
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

extension RegisterViewController: TableViewControllerable {
    func regiestCell() {
        tableView.register(InputTextCell.loadNib(), forCellReuseIdentifier: InputTextCell.identifier)
        tableView.register(InputVerifyCell.loadNib(), forCellReuseIdentifier: InputVerifyCell.identifier)
    }
    
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
        viewModel.updateButtonStatus = { [weak self] status in
            guard let strongSelf = self else { return }
            strongSelf.registerButton.isEnabled = status
        }
        
        viewModel.reloadTableView = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tableView.reloadData()
        }
        viewModel.bind()
    }
}

extension RegisterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = viewModel.feeds[indexPath.row]
        
        switch data {
        case .account(let model), .password(let model), .again(let model), .verify(let model):
            if model.error {
                return 72.0
            } else {
                return 40.0
            }
        }
    }
}

extension RegisterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.feeds[indexPath.row]
        switch data {
        case .account(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: InputTextCell.identifier, for: indexPath) as! InputTextCell
            
            cell.valueChange = { text in
                model.value = text
            }
            
            cell.endChange = { [weak self] text in
                guard let strongSelf = self else { return }
                strongSelf.viewModel.request.account = text
                model.error = text.checkAccount()
                tableView.reloadRows(at: [indexPath], with: .none)
                tableView.scrollToRow(at: indexPath, at: .none, animated: false)
                strongSelf.viewModel.upButtonStatus()
            }
            
            cell.config(model)
            
            return cell
        case .password(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: InputTextCell.identifier, for: indexPath) as! InputTextCell
            
            cell.valueChange = { text in
                model.value = text
            }
            
            cell.endChange = { [weak self] text in
                guard let strongSelf = self else { return }
                strongSelf.viewModel.request.password = text
                model.error = text.checkPassword()
                tableView.reloadRows(at: [indexPath], with: .none)
                tableView.scrollToRow(at: indexPath, at: .none, animated: false)
                strongSelf.viewModel.upButtonStatus()
            }
            
            cell.config(model)
            
            return cell
        case .again(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: InputTextCell.identifier, for: indexPath) as! InputTextCell
            
            cell.valueChange = { text in
                model.value = text
            }
            
            cell.endChange = { [weak self] text in
                guard let strongSelf = self else { return }
                strongSelf.viewModel.request.password_confirmation = text
                model.error = strongSelf.viewModel.checkPasswordAgain(text)
                tableView.reloadRows(at: [indexPath], with: .none)
                tableView.scrollToRow(at: indexPath, at: .none, animated: false)
                strongSelf.viewModel.upButtonStatus()
            }
            
            cell.config(model)
            
            return cell
            
        case .verify(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: InputVerifyCell.identifier, for: indexPath) as! InputVerifyCell
            
            cell.valueChange = { text in
                model.value = text
            }
            
            cell.endChange = { [weak self] text in
                guard let strongSelf = self else { return }
                strongSelf.viewModel.request.verify = text
                model.error = strongSelf.viewModel.checkVerify(text)
                tableView.reloadRows(at: [indexPath], with: .none)
                tableView.scrollToRow(at: indexPath, at: .none, animated: false)
                strongSelf.viewModel.upButtonStatus()
            }
            
            cell.config(model)
            
            return cell
        }
    }
    
    
}
