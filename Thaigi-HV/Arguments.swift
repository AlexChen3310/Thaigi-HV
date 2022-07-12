//
//  Argument.swift
//  TFChessApp
//
//  Created by Johnny on 2021/12/16.
//

import Foundation
struct Arguments{
    static var allowDateRangeByBackend:ClosedRange<Date> {  backendlast30DayStartDate ... Date()
    }
    static var backendlast30DayStartDate: Date {
        Date().addingTimeInterval(-29 * .day)
    }
    static var backendlast7DayStartDate: Date {
        Date().addingTimeInterval(-6 * .day)
    }
    //測試：https://giocoplus.gf-gaming.com 正式:https://hlqp-proxy.inprohub.me/gf
    #if Release
    static var url:URL = URL(string: "https://www.inprohub.me/")!
    #else
    static var url:URL = URL(string: "https://giocoplus.gf-gaming.com")!
    #endif
    static var wtoken: String = UserDefaults.getStringForKey(UserDefaultKey.wtoken){
        didSet{
            UserDefaults.setStringForKey(wtoken, UserDefaultKey.wtoken)
        }
    }
    //測試：demo.hlqp6666.com 正式:www.hlqp6666.com
    #if Release
    static var webSite = "www.hlqp6666.com"
    #else
    static var webSite = "demo.hlqp6666.com"
    #endif
    static var customSerivceUrl = ""
    static var domain = ""
}
