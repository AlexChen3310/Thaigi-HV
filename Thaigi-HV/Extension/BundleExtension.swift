//
//  BundleExtension.swift
//  TFChessApp
//
//  Created by Johnny on 2021/12/13.
//

import Foundation
import UIKit.UIImage

extension Bundle{
    public var icon: UIImage? {
        
        if let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
           let primary = icons["CFBundlePrimaryIcon"] as? [String: Any],
           let files = primary["CFBundleIconFiles"] as? [String],
           let icon = files.last
        {
            return UIImage(named: icon)
        }
        
        return nil
    }
    public var appName: String {
        guard let infoDic = infoDictionary, let name = infoDic["CFBundleDisplayName"] as? String else {
            return ""
        }
        return name
   
    }
}
