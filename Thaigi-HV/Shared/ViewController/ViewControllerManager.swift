//
//  ViewControllerManager.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/12.
//

import Foundation
import UIKit.UIViewController

enum Target {
    case loading
    case login
    case register
    case forget
    case lobby
}

extension Target{
    func getTargetVC() -> UIViewController {
        switch self {
        case .loading:
            let vc = HUDViewController(nibName: "HUDViewController", bundle: nil)
            return vc
        case .login:
            let vc = LoginViewController()
            let nav = BaseNavigationController(rootViewController: vc)
            return nav
        case .register:
            let vc = RegisterViewController()
            return vc
        case .forget:
            let vc = ForgetViewController()
            return vc
        case .lobby:
            let vc = LobbyViewController()
            let nav = BaseNavigationController(rootViewController: vc)
            return nav
        }
    }
}

class ViewControllerManager {
    
    private(set) static var pushing = false
    class func push(to target: Target, hidesBottomBarWhenPushed: Bool = true,sender: UIViewController? = UIApplication.topViewController()){
        if pushing {return}
        pushing = true
        defer{pushing = false}
        let targetVC = target.getTargetVC()
        targetVC.hidesBottomBarWhenPushed = false
        if UIApplication.topViewController()?.isKind(of: HUDViewController.self) == true{
            UIApplication.topViewController()?.dismiss(animated: false, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.33, execute: {
                if hidesBottomBarWhenPushed && UIApplication.topViewController()?.navigationController?.viewControllers.count == 1{
                    targetVC.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
                }
                UIApplication.topViewController()?.navigationController?.pushViewController(targetVC, animated: true)
            })
        }else{
            DispatchQueue.main.async {
                if hidesBottomBarWhenPushed && UIApplication.topViewController()?.navigationController?.viewControllers.count == 1{
                    targetVC.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
                }
                sender?.navigationController?.pushViewController(targetVC, animated: true)
            }
        }
    }
    class func present(to target: Target, sender: UIViewController? = UIApplication.topViewController(), animated: Bool = true){
        let targetVC = target.getTargetVC()
        targetVC.modalPresentationStyle = .overFullScreen
        if UIApplication.topViewController()?.isKind(of: HUDViewController.self) == true{
            UIApplication.topViewController()?.dismiss(animated: false, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.33, execute: {
                UIApplication.topViewController()?.present(targetVC, animated: animated, completion: nil)
            })
        }else{
            DispatchQueue.main.async {
                sender?.present(targetVC, animated: animated, completion: nil)
            }
        }
    }
}
