//
//  ButtonExtension.swift
//  imf88
//
//  Created by Johnny on 2020/9/28.
//  Copyright © 2020 Goldenf. All rights reserved.
//

import class UIKit.UIButton
import class UIKit.UIColor
import class UIKit.UIFont


extension UIButton {
    struct ButtonStyle {
        let titleColor:UIColor?
        let titleFont: UIFont?
    }
    var buttonStyle:ButtonStyle {
        ButtonStyle(
            titleColor: self.titleColor(for: .normal),
            titleFont: self.titleLabel?.font)
    }
    func with(style: ButtonStyle) -> Self {
        self.copyButtonStyle(from: style)
        return self
    }
    func copyButtonStyle(from style:ButtonStyle) {
        self.setTitleColor(style.titleColor, for: .normal)
        self.titleLabel?.font = style.titleFont
    }
}
extension UIButton.ButtonStyle {
    internal init(titleColor: UIColor?) {
        self.titleColor = titleColor
        self.titleFont = .systemFont(ofSize: 14)
    }
    
    static var cancelStyle = UIButton.ButtonStyle(titleColor: .white)
    static var confirmStyle = UIButton.ButtonStyle(titleColor: .white)
}
