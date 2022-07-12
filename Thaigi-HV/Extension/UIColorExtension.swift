//
//  UIColorExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/5/26.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    struct GradientMaker {
        internal init(colors: [CGColor], locations: [NSNumber]?, direction: UIColor.GradientMaker.Direction = .topToBottom) {
            self.colors = colors
            self.locations = locations
            self.direction = direction
        }
        
        
        
        func makeLayer() -> CAGradientLayer {
            let gl = CAGradientLayer()
            gl.colors = colors
            gl.locations = locations
            let (s, e) = direction.makePoint()
            gl.startPoint = s
            gl.endPoint = e
            return gl
        }
        
        
        let colors:[CGColor]
        let locations:[NSNumber]?
        enum Direction {
            case topToBottom
            case bottomToTop
            case leftToRight
            case rightToLeft
            func makePoint() -> (startPoint:CGPoint, endPoint: CGPoint) {
                switch self {
                case .topToBottom:
                    return (CGPoint(x: 0.5, y: 0.0), CGPoint(x: 0.5, y: 1.0))
                    
                case .bottomToTop:
                    return (CGPoint(x: 0.5, y: 1.0), CGPoint(x: 0.5, y: 0.0))
                    
                case .leftToRight:
                    return (CGPoint(x: 0.0, y: 0.5), CGPoint(x: 1.0, y: 0.5))
                    
                case .rightToLeft:
                    return  (CGPoint(x: 1.0, y: 0.5), CGPoint(x: 0.0, y: 0.5))
                }
            }
        }
        let direction: Direction
    }
}
