//
//  LaunchViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/27.
//

import UIKit

class LaunchViewController: UIViewController {

    let viewModel = LaunchViewModel()
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = HVLaunch.title
            titleLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViewModel()
    }
    
    @IBAction func toLoginView(_ sender: Any) {
        ViewControllerManager.present(to: Target.login, sender: self, animated: false)
    }
}

extension LaunchViewController {
    func setupViewModel() {
        
        viewModel.updateView = { [weak self] in
            guard let strongSelf = self else { return }
            
        }
        
        viewModel.bind()
    }
}
