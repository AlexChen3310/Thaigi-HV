//
//  CellIdentifier.swift
//  imf88
//
//  Created by Johnny on 2020/8/11.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    class var identifier: String {
        get {
            return String(describing: self)
        }
    }
}

extension UICollectionViewCell {
    class var identifier: String {
        get {
            return String(describing: self)
        }
    }
}

extension UITableViewHeaderFooterView {
    class var identifier: String {
        get {
            return String(describing: self)
        }
    }
}
