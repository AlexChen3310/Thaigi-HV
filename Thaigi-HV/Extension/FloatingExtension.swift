//
//  FloatingExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/7/3.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation

protocol FloatStringConvertible{
    
    func description(floatCount: Int) -> String
}
extension Double: FloatStringConvertible {
 func description(floatCount: Int) -> String{
    String(format: "%.\(floatCount)f", self)
    }
}

extension Float: FloatStringConvertible {
 func description(floatCount: Int) -> String{
    String(format: "%.\(floatCount)f", self)
    }
}

protocol Rounding {
    func rounded(to digit: Int) -> Self
}

extension Float:Rounding {
    func rounded(to digit: Int) -> Float {
        let x = powf(10, Float(digit))
        let rounded = (self * x).rounded()
        return rounded / x
    }
}
