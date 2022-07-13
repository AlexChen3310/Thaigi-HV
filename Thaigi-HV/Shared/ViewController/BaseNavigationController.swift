//
//  BaseNavigationController.swift
//  TFChessApp
//
//  Created by Johnny on 2021/12/8.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    
    var statusBarView: UIView?
    
    func setStatusBar(backgroundColor: UIColor?) {
        if let statusBarView = statusBarView {
            statusBarView.backgroundColor = backgroundColor
        }else{
            let statusBarFrame: CGRect
            if #available(iOS 13.0, *) {
                statusBarFrame = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
            } else {
                statusBarFrame = UIApplication.shared.statusBarFrame
            }
            statusBarView = UIView(frame: statusBarFrame)
            statusBarView?.backgroundColor = backgroundColor
            view.addSubview(statusBarView!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationbarStyle()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
fileprivate extension BaseNavigationController {
    func setNavigationbarStyle() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.barStyle = .black
    }
}
