//
//  DefaultCellViewModel.swift
//  imf88
//
//  Created by Johnny on 2020/8/17.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

class DefaultCellViewModel {
    
    var accessoryIcon: UIImage?
    var title: String
    
    init(accessoryIcon: UIImage? = nil, title: String) {
        
        self.accessoryIcon = accessoryIcon
        self.title = title
     }
}
