//
//  ViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ssss")
    }

    @IBAction func toLobby () {
        ViewControllerManager.present(to: Target.login)
    }
}

