//
//  OptionalExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/7/6.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation

extension Optional {
    @inlinable
    var isNil:Bool {self == nil}
    @inlinable
    func `do`(_ then: (Wrapped) -> Void) {
        switch self {
            case .some(let value):
            then(value)
            default:
            return
            
        }
    }
}

extension Optional: CustomStringConvertible {
    @inlinable
    public var description: String {
        switch self {
            case let .some(value): return "\(value)"
            default: return "nil"
        }
    }
}
