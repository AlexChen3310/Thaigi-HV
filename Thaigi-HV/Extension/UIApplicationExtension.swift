//
//  UIApplicationExtension.swift
//  imf88
//
//  Created by Johnny on 2020/8/6.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
    func getStatusBarFrame() -> CGRect{
        
        if #available(iOS 13.0, *) {
            return keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            return statusBarFrame
        }
    }
}
