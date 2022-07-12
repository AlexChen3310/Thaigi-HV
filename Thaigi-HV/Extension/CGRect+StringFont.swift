//
//  CGRect+StringFont.swift
//  imf88
//
//  Created by Johnny on 2020/9/3.
//  Copyright © 2020 Mac. All rights reserved.
//

import CoreGraphics
import class UIKit.UIFont
/// https://gist.github.com/cotkjaer/9b5af14a473e7c20fec1b0e965fe302b
extension CGRect {
    /** the x-coordinate of this rectangles center
    - note: Acts as a settable midX
    - returns: The x-coordinate of the center
     */
    var centerX: CGFloat
        {
        get { return midX }
        set { origin.x = newValue - width * 0.5 }
    }
    
    /** the y-coordinate of this rectangles center
     - note: Acts as a settable midY
     - returns: The y-coordinate of the center
     */
    var centerY: CGFloat
        {
        get { return midY }
        set { origin.y = newValue - height * 0.5 }
    }
}
extension CGSize {
    init(_ text:String, font: UIFont) {
        self = text.size(withAttributes:[.font: font])
    }
}
