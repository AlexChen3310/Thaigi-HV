//
//  ResultExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/7/6.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation
extension Result {
    var isSuccess:Bool {switch self {
        case .success:return true
        case .failure: return false
        }}
    func tryMap<T>( _ transformer: (Success) throws -> T ) -> Result<T,Error> {
        switch self {
        case .success(let value):
            do {
                let newValue = try transformer(value)
                return .success(newValue)
            } catch let tError {
                return .failure(tError)
            }
            
        case .failure(let error):
            return .failure(error)
        }
    }
}

extension Result where Success :Collection {
    func map<T>(_ transformer:(Success.Element)->T) -> Result<Array<T>,Failure> {
        switch self {
            case .success(let list):
                let newValue = list.map(transformer)
                return .success(newValue)
            case .failure(let error):
                return  .failure(error)
        }
    }
}

extension Result where Failure == Never {
    @inlinable
    func get() -> Success {
        switch self {
            case let .success(s):
            return s
            case let .failure(n): fatalError(n.localizedDescription)
        }
    }
}
