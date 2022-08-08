//
//  SettingCellViewModel.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/8/3.
//

import Foundation

class SettingCellViewModel {
    let imageName: String
    let title: String
    
    var language: String = ""
    var isOpen: Bool = false
    
    internal init (imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
}
