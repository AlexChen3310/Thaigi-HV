//
//  SettingViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/3.
//

import UIKit

class SettingViewController: BaseTableViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var mainView: UIView! {
        didSet {
            mainView.layer.cornerRadius = 10.0
            mainView.layer.borderColor = UIColor.init(hexString: "bc7ece").cgColor
            mainView.layer.borderWidth = 2.0
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = HVSetting.title
            titleLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    
    @IBOutlet weak var boardView: UIView! {
        didSet {
            boardView.layer.cornerRadius = 4.0
            boardView.backgroundColor = UIColor.init(hexString: "1b0545")
        }
    }
    @IBOutlet weak var logoutButton: UIButton! {
        didSet {
            logoutButton.setTitleColor(UIColor.init(hexString: "ffffff"), for: .normal)
            logoutButton.layer.cornerRadius = 4.0
            logoutButton.setImage(UIImage(named: "setting_logout"), for: .normal)
            logoutButton.setTitle(HVSetting.Button.logout, for: .normal)
        }
    }
    @IBOutlet weak var serviceButton: UIButton! {
        didSet {
            serviceButton.setTitleColor(UIColor.init(hexString: "ffffff"), for: .normal)
            serviceButton.layer.cornerRadius = 4.0
            serviceButton.setTitle(HVSetting.Button.service, for: .normal)
        }
    }
    
    let viewModel = SettingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        regiestCell()
        setup()
        setupView()
        setupViewModel()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: false)
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        
    }
    
    @IBAction func serviceAction(_ sender: Any) {
        
    }
}

extension SettingViewController: TableViewControllerable {
    func regiestCell() {
        tableView.register(SettingSelectCell.loadNib(), forCellReuseIdentifier: SettingSelectCell.identifier)
        tableView.register(SettingSwitchCell.loadNib(), forCellReuseIdentifier: SettingSwitchCell.identifier)
    }
    
    func setup() {
        
    }
    
    func setupView() {
        let colors = [UIColor(hexString: "2d0b6c").cgColor,
                      UIColor(hexString: "3b0ea6").cgColor,
                      UIColor(hexString: "2c0b69").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 1], direction: .topToBottom)
        mainView.applyGradient(gradientMaker: gradient)
        
        let logoutColors = [UIColor(hexString: "9e71e7").cgColor,
                      UIColor(hexString: "471085").cgColor,
                      UIColor(hexString: "4c12a5").cgColor]
        let logoutGradient = UIColor.GradientMaker(colors: logoutColors, locations: [0, 0.51, 1], direction: .topToBottom)
        
        logoutButton.applyGradient(gradientMaker: logoutGradient)
        
        let serviceColors = [UIColor(hexString: "c8f5f8").cgColor,
                      UIColor(hexString: "2f6b73").cgColor,
                      UIColor(hexString: "73c7d0").cgColor]
        let serviceGradient = UIColor.GradientMaker(colors: serviceColors, locations: [0, 0.51, 1], direction: .topToBottom)
        
        serviceButton.applyGradient(gradientMaker: serviceGradient)
    }
    
    func setupViewModel() {
        viewModel.reloadTableView = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tableView.reloadData()
        }
        
        viewModel.bind()
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.feeds[indexPath.row]
        switch data {
        case .language(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSelectCell.identifier, for: indexPath) as! SettingSelectCell
            
            cell.congfig(model, view: self.tableView)
            
            cell.openSelectView = { isOpen in
                if isOpen {
                    tableView.isScrollEnabled = false
                } else {
                    tableView.isScrollEnabled = true
                }
            }
            
            return cell
        case .music(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchCell.identifier, for: indexPath) as! SettingSwitchCell
            
            cell.congfig(model)
            
            cell.switchCallBack = {
                model.isOpen = !model.isOpen
                tableView.reloadRows(at: [indexPath], with: .none)
            }
            
            return cell
        case .sound(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchCell.identifier, for: indexPath) as! SettingSwitchCell
            
            cell.congfig(model)
            
            cell.switchCallBack = {
                model.isOpen = !model.isOpen
                tableView.reloadRows(at: [indexPath], with: .none)
            }
            
            return cell
        case .quick(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchCell.identifier, for: indexPath) as! SettingSwitchCell
            
            cell.congfig(model)
            
            cell.switchCallBack = {
                model.isOpen = !model.isOpen
                tableView.reloadRows(at: [indexPath], with: .none)
            }
            
            return cell
            
        }
    }
}
