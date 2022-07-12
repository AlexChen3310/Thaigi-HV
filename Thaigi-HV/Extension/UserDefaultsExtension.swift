//
//  UserDefaultsExtension.swift
//  IMF88
//
//  Created by Johnny on 2020/6/2.
//  Copyright © 2020 IMF88. All rights reserved.
//

import Foundation
/// UserDefault Key
enum UserDefaultKey {
    
    /// 使用者是否勾選記住用戶名
    static let KeepUserNameSetting = "KeepUserNameSetting"
    /// 使用者是否勾選記住手機號
    static let KeepUserPhoneSetting = "KeepUserPhoneSetting"
    /// 用戶名存放的key
    static let UserName = "UserName"
    /// 用戶手機放的key
    static let UserPhone = "UserPhone"
    /// 用戶名存登入用密碼的key
    static let UserNamePW = "UserNamePW"
    /// 用戶手機登入用密碼的key
    static let UserPhonePW = "UserPhonePW"
    /// 客服的網址
    static let customSerivce = "customSerivce"
    /// 前一則公告
    static let announcementCache = "announcementCache"
    /// 公告顯示的設定
    static let announcementSetting = "announcementSetting"
    /// LOGO
    static let logo = "logo"
    /// 投注記錄的設定
    static let betHistoryCategory = "betHistoryCategory"
    /// Wtoken
    static let wtoken = "wtoken"
}
extension UserDefaults {
    class func setStringForKey(_ value:String ,_ key:String) {
        if value == ""{
            UserDefaults.standard.removeObject(forKey: key);
        }else{
            UserDefaults.standard.set(value, forKey: key);
        }
        UserDefaults.standard.synchronize()
    }
    class func getStringForKey(_ key:String) -> String {
        if let value = UserDefaults.standard.string(forKey: key){
            return value;
        }else{
            return "";
        }
    }
    class func getArrayForKey(_ key:String) -> Array<Any>{
        if let value = UserDefaults.standard.array(forKey: key){
            return value;
        }else{
            return Array<Any>();
        }
    }
    class func setArrayForKey(_ value:Array<Any>? ,_ key:String) {
        if value == nil{
            UserDefaults.standard.removeObject(forKey: key);
        }else{
            UserDefaults.standard.set(value, forKey: key);
        }
        UserDefaults.standard.synchronize()
    }
    class func setBoolForKey(_ value:Bool, _ key: String){
        
        UserDefaults.standard.set(value, forKey: key);
        UserDefaults.standard.synchronize()
    }
    class func getBoolForKey(_ key:String) -> Bool{
        let value = UserDefaults.standard.bool(forKey: key)
        return value
    }
//    class func setObjectForKey(_ key:String, object:Any){
//        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: object)
//        UserDefaults.standard.set(encodedData, forKey: key)
//        UserDefaults.standard.synchronize()
//    }
//    class func getObjectForKey(_ key:String) -> Any? {
//        guard let object = UserDefaults.standard.data(forKey: key) else{
//            return nil
//        }
//        let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: object)
//        return decodedTeams
//    }
}
