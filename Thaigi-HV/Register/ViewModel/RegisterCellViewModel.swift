//
//  RegisterCellViewModel.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/2.
//

import Foundation
import UIKit

class RegisterCellViewModel {
    let imageName: String
    let placeholder: String
    let errorMessage: String
    var verify: UIImage?
    var value: String = ""
    var error: Bool = false
    
    internal init (imageName: String, placeholder: String, errorMessage: String) {
        self.imageName = imageName
        self.placeholder = placeholder
        self.errorMessage = errorMessage
    }
}
