//
//  InputTextViewCellViewModel.swift
//  TFChessApp
//
//  Created by 家碩 張 on 2021/3/26.
//

import Foundation
import UIKit.UIColor
import UIKit.UIImage

class InputTextViewCellViewModel:InputTextViewable {
    
    var keyboardType: UIKeyboardType
    var title: String
    var titleColor: UIColor
    var content: String
    var contentColor: UIColor
    var placeHolder: String
    var placeHolderColor: UIColor
    var hint: String
    var hintColor: UIColor
    var showHint: Bool
    var canEditing: Bool
    var iconImage: UIImage?
    var isSecureTextEntry: Bool
    var unFocusColor: UIColor
    var canBeChanged: Bool
    
    init(keyboardType: UIKeyboardType = .default,
         title: String,
         titleColor: UIColor = .white,
         content: String,
         contentColor: UIColor = .white,
         placeHolder: String,
         placeHolderColor: UIColor = .gray,
         hint: String,
         hintColor: UIColor = .red,
         showHint: Bool = false,
         canEditing: Bool,
         iconImage: UIImage? = nil,
         isSecureTextEntry: Bool = false,
         unFocusColor:UIColor = .black,
         canBeChanged: Bool = false) {
        
        self.keyboardType = keyboardType
        self.title = title
        self.titleColor = titleColor
        self.content = content
        self.contentColor = contentColor
        self.placeHolder = placeHolder
        self.placeHolderColor = placeHolderColor
        self.hint = hint
        self.hintColor = hintColor
        self.showHint = showHint
        self.canEditing = canEditing
        self.iconImage = iconImage
        self.isSecureTextEntry = isSecureTextEntry
        self.unFocusColor = unFocusColor
        self.canBeChanged = canBeChanged
    }
}
