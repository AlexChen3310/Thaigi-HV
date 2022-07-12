//
//  ErrorExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/7/6.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation

struct AnyError:Error,LocalizedError {
    static var `default`: AnyError {AnyError("未知的错误")}
    internal init(
        _ error: Error? = nil) {
        self.error = error
        self._message = nil
    }
    internal init(_ _message: String?) {
     
        self.error = nil
        self._message = _message
    }
    internal init() {
        self.error = nil
        self._message = nil
    }
    var error:Error?
    var _message: String?
    var errorDescription: String? {
        error?.localizedDescription ?? _message ?? .unknowError
    }
}
