//
//  LanguageManager.swift
//  imf88
//
//  Created by 家碩 張 on 2021/6/1.
//  Copyright © 2021 Goldenf. All rights reserved.
//

import Foundation

enum Language: String{
    case english = "en"
    case chineseSimplified = "zh-Hans"
    case thai = "th"
    case vietnamese = "vi"
}

final class LanguageManager {
    
    var languageSetting: Language
    
    private static var instance: LanguageManager?
    
    static var shared: LanguageManager {
        if instance == nil {
            instance = LanguageManager(defaultSetting: .chineseSimplified)
        }
        return instance!
    }
    
    private init(defaultSetting: Language) {
        self.languageSetting = defaultSetting
    }
    func setLanguage(lang: String){
        switch lang.lowercased() {
        case "zh-cn", "zh-hans":
            languageSetting = .chineseSimplified
        case "th":
            languageSetting = .thai
        case "vi", "vn", "vi-vn":
            languageSetting = .vietnamese
        default:
            languageSetting = .chineseSimplified
        }
    }
}
