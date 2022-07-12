//
//  BoolExtension.swift
//  imf88
//
//  Created by Johnny on 2020/8/13.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
extension Bool {
    @inlinable
    var not:Bool {!self}
    @inlinable
    func `if`(_ then:()->Void) {
        if self {then()}
    }
    @inlinable
    func `if`<T>(_ give:()-> T) -> T?{
        self ? give() : nil
    }
}
