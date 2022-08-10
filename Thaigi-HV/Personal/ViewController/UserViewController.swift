//
//  UserViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/9.
//

import UIKit

class UserViewController: BaseTableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        regiestCell()
        setup()
        setupView()
        setupViewModel()

    }
}

extension UserViewController: TableViewControllerable {
    func regiestCell() {
        tableView.register(UserDataCell.loadNib(), forCellReuseIdentifier: UserDataCell.identifier)
        tableView.register(UserTwoDataCell.loadNib(), forCellReuseIdentifier: UserTwoDataCell.identifier)
        tableView.register(UserDataLargeCell.loadNib(), forCellReuseIdentifier: UserDataLargeCell.identifier)
    }
    
    func setup() {
            
    }
    
    func setupView() {
        tableView.backgroundColor = UIColor.init(hexString: "1b0545")
        tableView.dataSource = self
    }
    
    func setupViewModel() {
        
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserDataLargeCell.identifier, for: indexPath) as! UserDataLargeCell
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserDataCell.identifier, for: indexPath) as! UserDataCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTwoDataCell.identifier, for: indexPath) as! UserTwoDataCell
            return cell
        }
    }
}
