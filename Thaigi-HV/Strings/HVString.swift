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

    enum Error {
        //帳號由5-16個字母數字組成
        static var account: String { return "register_error_account".localizable }
        //密码最少需要6个字元
        static var password: String { return "register_error_password".localizable }
        //密码请保持一致
        static var confirm: String { return "register_error_passwordConfirm".localizable }
        //验证码有误
        static var verify: String { return "register_error_verify".localizable }
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

enum HVSetting {
    //設定
    static var title: String { return "setting_title".localizable }
    
    enum Title {
        //語系
        static var language: String { return "setting_language_title".localizable }
        //音樂
        static var music: String { return "setting_music_title".localizable }
        //音效
        static var sound: String { return "setting_sound_title".localizable }
        //快速登入
        static var quick: String { return "setting_quick_title".localizable }
    }
    enum Language {
        //繁體中文
        static var zh: String { return "setting_type_language_zh".localizable }
    }
    enum Switch {
        //開啟
        static var on: String { return "setting_switch_on".localizable }
        //關閉
        static var off: String { return "setting_switch_off".localizable }
    }
    enum Button {
        //登出
        static var logout: String { return "setting_button_logout".localizable }
        //24Ｈ客服
        static var service: String { return "setting_button_service".localizable }
    }
}

enum HVPersonal {
    enum Tab {
        //個人資料
        static var personal: String { return "personal_title".localizable }
    }
    
    enum Content {
        //會員帳號
        static var account: String { return "personal_title_account".localizable }
        //名
        static var name: String { return "personal_title_name".localizable }
        //姓
        static var frist: String { return "personal_title_frist_name".localizable }
        //手機號碼
        static var phone: String { return "personal_title_phone".localizable }
        //性別
        static var gender: String { return "personal_title_gender".localizable }
        //生日
        static var birthday: String { return "personal_title_birthday".localizable }
        //身分證號
        static var idnumber: String { return "personal_title_idnumber".localizable }
        //電子信箱
        static var mail: String { return "personal_title_mail".localizable }
        //Facebook帳號
        static var facebook: String { return "personal_title_facebook".localizable }
        //Line帳號
        static var line: String { return "personal_title_line".localizable }
        //銀行
        static var bank: String { return "personal_title_bank".localizable }
        //銀行帳號
        static var bank_account: String { return "personal_title_bank_account".localizable }
        //持卡人姓名
        static var bank_name: String { return "personal_title_bank_name".localizable }
    }

    enum Section {
        //銀行帳戶信息
        static var bnak_data: String { return "personal_title_bank_data".localizable }
        //未有資料
        static var bank_name: String { return "personal_title_no_data".localizable }
    }

    enum Button {
        //保存資料
        static var save: String { return "personal_button_save".localizable }
        //個人資料
        static var user: String { return "personal_button_user".localizable }
        //下注紀錄
        static var record: String { return "personal_button_record".localizable }
        //更改登入密碼
        static var password: String { return "personal_button_password".localizable }
    }
}
