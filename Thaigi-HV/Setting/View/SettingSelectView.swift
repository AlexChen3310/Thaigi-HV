//
//  SettingSelectView.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/8.
//

import UIKit

class SettingSelectView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        print("Show View")
//        tableView.dataSource = self
        tableView.register(SelectCell.loadNib(), forCellReuseIdentifier: SelectCell.identifier)
        tableView.bounces = true
    }
    
}

extension SettingSelectView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension SettingSelectView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectCell.identifier, for: indexPath) as! SelectCell
        return cell
    }
    
    
}
