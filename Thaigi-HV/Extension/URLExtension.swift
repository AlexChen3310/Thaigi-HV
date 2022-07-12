//
//  URLExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/6/20.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation
extension URL {
    var baseDomain: URL? {
      guard
        let urlcomponents = URLComponents(url: self, resolvingAgainstBaseURL: false),
        let scheme = urlcomponents.scheme,
        let host = urlcomponents.host
        else {return nil}
      return URL(string: "\(scheme)://\(host)")
    }
}

