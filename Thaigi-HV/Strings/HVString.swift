//
//  HVString.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/20.
//

import Foundation

enum HVLaunch {
    static var title: String { return "launch_touch_title".localizable }
}

enum HVLogin {
    //會員登入
    static var title: String { return "login_logo_title".localizable }
    
    enum PlaceHolder {
        //會員帳號
        static var account: String { return "login_placeholder_account".localizable }
        //密碼
        static var password: String { return "login_placeholder_password".localizable }
    }
    
    enum Button {
        //登入
        static var login: String { return "login_button_login".localizable }
        //記住我
        static var remember: String { return "login_button_remember".localizable }
        //免費註冊
        static var register: String { return "login_button_register".localizable }
        //忘記密碼
        static var forget: String { return "login_button_forget".localizable }
    }
}

enum HVRegister {
    
    //免費註冊
    static var title: String { return "register_title".localizable }
    
    enum Placeholder {
        //會員帳號
        static var account: String { return "register_placeholder_account".localizable }
        //密碼
        static var password: String { return "register_placeholder_password".localizable }
        //確認密碼
        static var again: String { return "register_placeholder_password_again".localizable }
        //請輸入驗證碼
        static var verify: String { return "register_placeholder_verify".localizable }
    }
    
    enum Button {
        //註冊
        static var register: String { return "register_button_register".localizable }
    }
    
    enum Treaty {
        //我已同意「THIGI網站規章」
        static var treaty: String { return "register_treaty_label".localizable }
    }
}

enum HVForget {
    //忘記密碼
    static var title: String { return "forget_title".localizable }
    
    enum SendType {
        //手機號碼
        static var phone: String { return "forget_type_phone".localizable }
        //電子信箱
        static var mail: String { return "forget_type_mail".localizable }
    }
    
    enum Placeholder {
        //會員帳號
        static var account: String { return "forget_placeholder_account".localizable }
        //請輸入手機號碼
        static var phone: String { return "forget_placeholder_phone".localizable }
        //請輸入電子信箱
        static var mail: String { return "forget_placeholder_mail".localizable }
        //請輸入驗證碼
        static var verify: String { return "forget_placeholder_verify".localizable }
    }
    
    enum Button {
        //提交
        static var send: String { return "forget_button_send".localizable }
    }
}


enum HVLobby {
    enum Top {
        //VIP
        static var vip: String { return "lobby_top_vip".localizable }
        //龍虎榜
        static var rank: String { return "lobby_top_rank".localizable }
    }
    
    enum Footer {
        //以老帶新
        static var recommend: String { return "lobby_footer_recommend".localizable }
        //優惠申請
        static var bonus: String { return "lobby_footer_bonus".localizable }
        //通知訊息
        static var message: String { return "lobby_footer_message".localizable }
        //24H客服
        static var service: String { return "lobby_footer_service".localizable }
        //存款
        static var deposit: String { return "lobby_footer_deposit".localizable }
    }
}
