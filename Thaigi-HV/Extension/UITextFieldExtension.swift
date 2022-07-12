//
//  UITextFieldExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/5/26.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    public func setPlaceHolder(placeHolder: String, color:UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                        attributes: [NSAttributedString.Key.foregroundColor: color]);
    }
    public func setPlaceHolder(placeHolder: String, color:UIColor, fontSize:CGFloat) {
        self.attributedPlaceholder = NSAttributedString(string: placeHolder,
                                                        attributes: [NSAttributedString.Key.foregroundColor: color,NSAttributedString.Key.font:UIFont.systemFont(ofSize: fontSize)]);
    }
}
